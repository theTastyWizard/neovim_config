return {
    "rebelot/heirline.nvim",
    event = { "UiEnter" },
    config = function()
        local conditions = require("heirline.conditions")
        local utils = require("heirline.utils")

        local function setup_colors()
            return {
                black = "#000000",
				white = '#f5f5f5',
                bg = "#171517",
				bright_bg = "#30365F",
                pink = "#ff0066",
                blue = "#007fff",
                cyan = "#00ffff",
                green = "#00ff66",
                darker_green = "#20df6c",
                yellow = "#ffa600",
                orange = "#d65407",
                purple = "#6600ff",
                diag_warn = utils.get_highlight("DiagnosticWarn").fg,
                diag_error = utils.get_highlight("DiagnosticError").fg,
                diag_hint = utils.get_highlight("DiagnosticHint").fg,
                diag_info = utils.get_highlight("DiagnosticInfo").fg,
                git_del = utils.get_highlight("GitSignsDelete").fg,
                git_add = utils.get_highlight("GitSignsAdd").fg,
                git_change = utils.get_highlight("GitSignsChange").fg,
            }
        end

        vim.api.nvim_create_augroup("Heirline", { clear = true })
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                utils.on_colorscheme(setup_colors)
            end,
            group = "Heirline",
        })


        require("heirline").load_colors(setup_colors)

        local ViMode = {
            init = function(self)
                self.mode = vim.fn.mode(1) -- :h mode()
            end,
            static = {
                mode_names = { -- change the strings if you like it vvvvverbose!
                    n = "N",
                    no = "N?",
                    nov = "N?",
                    noV = "N?",
                    ["no\22"] = "N?",
                    niI = "Ni",
                    niR = "Nr",
                    niV = "Nv",
                    nt = "Nt",
                    v = "V",
                    vs = "Vs",
                    V = "-V",
                    Vs = "Vs",
                    ["\22"] = "^V",
                    ["\22s"] = "^V",
                    s = "S",
                    S = "S_",
                    ["\19"] = "^S",
                    i = "I",
                    ic = "Ic",
                    ix = "Ix",
                    R = "R",
                    Rc = "Rc",
                    Rx = "Rx",
                    Rv = "Rv",
                    Rvc = "Rv",
                    Rvx = "Rv",
                    c = "C",
                    cv = "Ex",
                    r = "...",
                    rm = "M",
                    ["r?"] = "?",
                    ["!"] = "!",
                    t = "T",
                },
            },
            provider = function(self)
                return " %2(" .. self.mode_names[self.mode] .. "%)"
            end,
            -- hl = { fg = 'black', bold = true, },
            hl = function(self)
                local color = self:mode_color()
                return { fg = color, bold = true, }
            end,
			update = {
				"ModeChanged", 
				pattern = "*:*", 
				callback = vim.schedule_wrap(function ()
					vim.cmd("redrawstatus")
				end),
			}
        }


        local FileNameBlock = {
            -- let's first set up some attributes needed by this component and its children
            init = function(self)
                self.filename = vim.api.nvim_buf_get_name(0)
            end,
        }
		-- Mitt
		local JustFileName = {
            init = function(self)
                self.filename = vim.api.nvim_buf_get_name(0)
            end,
			provider = function(self)
				return vim.fn.fnamemodify(self.filename, ":t:r")
			end,
            hl = { fg = "blue", },
		}

        -- We can now define some children separately and add them later
        local FileName = {
            init = function(self)
                self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
                if self.lfilename == "" then self.lfilename = "[No Name]" end
            end,
            -- -- hl = { fg = utils.get_highlight("Directory").fg },
            hl = { fg = "blue", },

            flexible = 2,

            {
                provider = function(self)
                    return self.lfilename
                end,
            },
            {
                provider = function(self)
                    return vim.fn.pathshorten(self.lfilename)
                end,
            },
        }

        local FileFlags = {
            {
                condition = function()
                    return vim.bo.modified
                end,
                provider = " [+]",
                hl = { fg = "green" },
            },
            {
                condition = function()
                    return not vim.bo.modifiable or vim.bo.readonly
                end,
                provider = " ",
                hl = { fg = "orange" },
            },
        }
        -- let's add the children to our FileNameBlock component
        FileNameBlock = utils.insert(FileNameBlock,
            FileName,
            FileFlags,
            { provider = '%<' } -- this means that the statusline is cut here when there's not enough space
        )

        local FileIcon = {
            init = function(self)
                self.filename = vim.api.nvim_buf_get_name(0) -- sett til að virki fyrir utan block
                local filename = self.filename
                local extension = vim.fn.fnamemodify(filename, ":e")
                self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension,
                    { default = true })
            end,
            provider = function(self)
                return self.icon and (" " .. self.icon .. " ")
            end,
            hl = function(self)
                return { fg = self.icon_color }
            end
        }

        local FileType = {
            provider = function()
                return vim.bo.filetype
            end,
            hl = { fg = utils.get_highlight("Type").fg, bold = false },
        }

        local FileEncoding = {
            provider = function()
                local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
                return enc ~= 'utf-8' and enc:upper()
            end
        }

        local FileFormat = {
            provider = function()
                local fmt = vim.bo.fileformat
                return fmt ~= 'unix' and fmt:upper()
            end
        }

        local FileSize = {
            provider = function()
                -- stackoverflow, compute human readable file size
                local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
                local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
                fsize = (fsize < 0 and 0) or fsize
                if fsize < 1024 then
                    return fsize .. suffix[1]
                end
                local i = math.floor((math.log(fsize) / math.log(1024)))
                return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1])
            end
        }

        -- We're getting minimalist here!
        local Ruler = {
            -- %l = current line number
            -- %L = number of lines in the buffer
            -- %c = column number
            -- %P = percentage through file of displayed window
            -- provider = "%7(%l/%3L%):%2c %P",
            provider = "%2c:%7(%l/%3L%)",
            hl = function(self)
                local color = self:mode_color()
                return { fg = color, bold = true, }
            end,
        }

        local Diagnostics = {

            condition = conditions.has_diagnostics,

            static = {
                -- error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
                -- warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
                -- info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
                -- hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
                -- error_icon = '󰚌 ',
                -- warn_icon = ' ',
                -- hint_icon = '󱠂 ',
                -- info_icon = ' ',
                error_icon = 'E:',
                warn_icon = 'W:',
                hint_icon = 'h:',
                info_icon = 'i:',
            },

            init = function(self)
                self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
                self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
                self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
                self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
            end,

            update = { "DiagnosticChanged", "BufEnter" },

            {
                provider = function(self)
                    -- 0 is just another output, we can decide to print it or not!
                    return self.errors > 0 and (self.error_icon .. self.errors .. " ")
                end,
                hl = { fg = "diag_error" },
            },
            {
                provider = function(self)
                    return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
                end,
                hl = { fg = "diag_warn" },
            },
            {
                provider = function(self)
                    return self.info > 0 and (self.info_icon .. self.info .. " ")
                end,
                hl = { fg = "diag_info" },
            },
            {
                provider = function(self)
                    return self.hints > 0 and (self.hint_icon .. self.hints)
                end,
                hl = { fg = "diag_hint" },
            },
        }

        local Git = {
            condition = conditions.is_git_repo,

            init = function(self)
                self.status_dict = vim.b.gitsigns_status_dict
                self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or
                    self.status_dict.changed ~= 0
            end,

            hl = { fg = "yellow" },

			{
				provider = " "
			},
            { -- git branch name
                provider = function(self)
                    return self.status_dict.head
                end,
                hl = { fg = "white", bold = false }
            },
            -- You could handle delimiters, icons and counts similar to Diagnostics
            {
                condition = function(self)
                    return self.has_changes
                end,
                provider = "("
            },
            {
                provider = function(self)
                    local count = self.status_dict.added or 0
                    return count > 0 and ("+" .. count)
                end,
                hl = { fg = "git_add" },
            },
            {
                provider = function(self)
                    local count = self.status_dict.removed or 0
                    return count > 0 and ("-" .. count)
                end,
                hl = { fg = "git_del" },
            },
            {
                provider = function(self)
                    local count = self.status_dict.changed or 0
                    return count > 0 and ("~" .. count)
                end,
                hl = { fg = "git_change" },
            },
            {
                condition = function(self)
                    return self.has_changes
                end,
                provider = ")",
            },
        }

        local TerminalName = {
            provider = function()
                local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
                return " " .. tname
            end,
            hl = { fg = "blue", bold = true },
        }

        local HelpFileName = {
            condition = function()
                return vim.bo.filetype == "help"
            end,
            provider = function()
                local filename = vim.api.nvim_buf_get_name(0)
                return vim.fn.fnamemodify(filename, ":t")
            end,
            hl = { fg = "blue" },
        }

        local SearchCount = {
            condition = function()
                return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0
            end,
            init = function(self)
                local ok, search = pcall(vim.fn.searchcount)
                if ok and search.total then
                    self.search = search
                end
            end,
            provider = "  ",
            hl = { fg = "purple", },
            utils.surround({ "[", "]" }, nil, {
                provider = function(self)
                    local search = self.search
                    return string.format("%d/%d", search.current, math.min(search.total, search.maxcount))
                end,
                hl = { fg = "white", bold = false },
            })
        }

        local MacroRec = {
            condition = function()
                return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
            end,
            provider = " ",
            hl = { fg = "pink", bold = true },
            utils.surround({ "[", "]" }, nil, {
                provider = function()
                    return vim.fn.reg_recording()
                end,
                hl = { fg = "yellow", bold = false },
            }),
            update = {
                "RecordingEnter",
                "RecordingLeave",
            }
        }
		vim.opt.showcmdloc = 'statusline'
		local ShowCmd = {
			condition = function ()
				return vim.o.cmdheight == 0
			end,
			provider = ":%3.5(%S%)",
		}

        local Grapple = {
            provider = function() return require('grapple').statusline() end,
            -- utils.surround({"(", ")"}, nil, {
            --     provider = function()
            --         return require("grapple").statusline()
            --     end,
            -- }),
            update = {
                "BufEnter"
            }
        }

        local Align = { provider = "%=" }
        local Space = { provider = " " }

		-- Fyrir surround með litum
        -- Ruler = utils.surround({ "", "" }, function(self) return self:mode_color() end,
            -- { Ruler, hl = { fg = 'black' } })
        -- ViMode = utils.surround({ "", "" }, function(self) return self:mode_color() end,
			-- { ViMode })
		Ruler = utils.surround({ "", "" }, "bright_bg",{ Ruler })
		ViMode = utils.surround({ "", "" }, "bright_bg",{ ViMode })

        local DefaultStatusline = {
            ViMode, Space, JustFileName, FileFlags, Space, Git, Space, Diagnostics, Align,
            -- FileSize,
            { condition = require("grapple").exists(), Grapple },
			ShowCmd,
            MacroRec, SearchCount, FileIcon, FileType, Space, Ruler
        }

        local InactiveStatusline = {
            condition = conditions.is_not_active,
            FileNameBlock,
            Align
        }

        local SpecialStatusline = {
            condition = function()
                return conditions.buffer_matches({
                    buftype = { "nofile", "promt", "help", "quickfix" },
                    filetype = { "^git.*", "fugitive" },
                })
            end,
            FileType,
            Space,
            HelpFileName,
            Align,
            { condition = conditions.is_active, SearchCount, Space, Ruler },
        }

        local OilStatusline = {
            condition = function()
                return conditions.buffer_matches({
                    filetype = { "oil" }
                })
            end,
            { condition = conditions.is_active, ViMode, Space },
            FileNameBlock,
            Align,
            { condition = require("grapple").exists(), Grapple},
            { condition = conditions.is_active, MacroRec, Space, SearchCount, Space, Ruler },
        }

        local TerminalStatusline = {
            condition = function()
                return conditions.buffer_matches({
                    buftype = { "terminal", "FloatTerm" }
                })
            end,
            { condition = conditions.is_active, ViMode, Space },
            TerminalName,
            Align
        }

        local StatusLines = {
            hl = function()
                if conditions.is_active() then
                    return { bg = 'bg' }
                else
                    return "StatusLineNc"
                end
            end,

            fallthrough = false,

            OilStatusline,
            SpecialStatusline,
            TerminalStatusline,
            InactiveStatusline,
            DefaultStatusline,
            static = {
                mode_colors_map = {
                    n = "yellow",
                    i = "pink",
                    v = "green",
                    V = "green",
                    ["\22"] = "green",
                    c = "purple",
                    s = "purple",
                    S = "purple",
                    ["\19"] = "purple",
                    R = "yellow",
                    r = "yellow",
                    ["!"] = "pink",
                    t = "pink",
                },
                mode_color = function(self)
                    local mode = conditions.is_active() and vim.fn.mode() or "n"
                    return self.mode_colors_map[mode]
                end,
            },
        }
        require("heirline").setup({ statusline = StatusLines })
    end,
}
