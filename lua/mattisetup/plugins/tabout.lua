return {
    "kawre/neotab.nvim",
    event = "InsertEnter",
    opts = {
        tabkey = "",
        behavior = "nested",
        smart_punctuators = {
            enabled = true,
            semicolon = {
                enabled = true,
                ft = { "cs", "c", "cpp", "java" },
            },
        },
    },
}
