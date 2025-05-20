return {
	figure = {
		prefix = "fig",
		body = "#figure(\n\timage(\"$1.png\", width: 40%),\n\tcaption: [$0])",
		desc = "Figure with caption"
	},
	header = {
		prefix = "header",
		body =
		[[#let title = [$1]
		#let course = [$2]
		#let year = [2025]
		#let author = [Sigurður Marteinn Lyngberg Sigurðsson]
		#let email = [${3|sml11\@hi.is,mattipatti1998\@gmail.com|}] // escape fyrir att
		#align(center, text(22pt)[
		  *#title*
		])
		#align(center,text(16pt)[
		  #course #year \
		  #author \
		  #email
		])
		]],
		desc = "Header for assignment"
	}
}
