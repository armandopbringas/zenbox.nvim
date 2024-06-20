local zenbox = {}

zenbox.colors = {
	dark0_hard = "#1b1b1b",
	dark0 = "#1b1b1b",
	dark0_soft = "#1b1b1b",
	dark1 = "#3c3836",
	dark2 = "#504945",
	dark3 = "#665c54",
	dark4 = "#7c6f64",
	dark4_256 = "#7c6f64",
	gray_245 = "#928374",
	gray_244 = "#928374",

	bright_red = "#fb4934",
	bright_green = "#b8bb26",
	bright_yellow = "#fabd2f",
	bright_blue = "#83a598",
	bright_purple = "#d3869b",
	bright_aqua = "#8ec07c",
	bright_orange = "#fe8019", -- bright_orange

	neutral_red = "#cc241d",
	neutral_green = "#98971a",
	neutral_yellow = "#d79921",
	neutral_blue = "#458588",
	neutral_purple = "#b16286",
	neutral_aqua = "#689d6a",
	neutral_orange = "#d65d0e",

	faded_red = "#9d0006",
	faded_green = "#79740e",
	faded_yellow = "#b57614",
	faded_blue = "#076678",
	faded_purple = "#8f3f71",
	faded_aqua = "#427b58",
	faded_orange = "#af3a03", -- faded_orange

	light0_hard = "#f9f5d7",
	light0 = "#fbf1c7",
	light0_soft = "#f2e5bc",
	light1 = "#ebdbb2",
	light2 = "#d5c4a1",
	light3 = "#bdae93",
	light4 = "#a89984",
	light4_256 = "#a89984",
}

local function set_highlight(group, color)
	local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
	local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
	local style = color.style and "gui=" .. color.style or "gui=NONE"
	vim.cmd(string.format("highlight %s %s %s %s", group, fg, bg, style))
end

zenbox.apply = function()
	local colors = zenbox.colors

	-- General
	set_highlight("Normal", { fg = colors.gray_245, bg = colors.dark0 })
	set_highlight("Comment", { fg = colors.dark3, style = "italic" })

	-- Syntax
	set_highlight("Constant", { fg = colors.bright_orange }) -- const, let, var, class como bright_orange
	set_highlight("String", { fg = colors.bright_green })
	set_highlight("Function", { fg = colors.bright_blue })
	set_highlight("Identifier", { fg = colors.bright_purple })
	set_highlight("Statement", { fg = colors.faded_orange }) -- if, else, for, while, return como faded_orange
	set_highlight("Type", { fg = colors.bright_aqua })

	-- UI Elements
	set_highlight("LineNr", { fg = colors.dark3 })
	set_highlight("CursorLine", { bg = colors.dark1 })
	set_highlight("StatusLine", { fg = colors.dark4, bg = colors.dark2 })
	set_highlight("Visual", { bg = colors.dark2 })

	-- Additional Elements
	set_highlight("WarningMsg", { fg = colors.bright_orange })
	set_highlight("ErrorMsg", { fg = colors.bright_red, style = "bold" })
	set_highlight("Todo", { fg = colors.bright_blue, style = "bold" })
	set_highlight("Special", { fg = colors.bright_aqua })

	-- More groups can be added here...
end

return zenbox
