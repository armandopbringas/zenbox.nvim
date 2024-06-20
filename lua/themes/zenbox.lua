local zenbox = {}

zenbox.colors = {
	dark0_hard = "#1b1b1b", -- Actualizado
	dark0 = "#1b1b1b", -- Actualizado
	dark0_soft = "#1b1b1b", -- Actualizado
	dark1 = "#3c3836", -- 60-56-54
	dark2 = "#504945", -- 80-73-69
	dark3 = "#665c54", -- 102-92-84
	dark4 = "#7c6f64", -- 124-111-100
	dark4_256 = "#7c6f64", -- 124-111-100
	gray_245 = "#928374", -- 146-131-116
	gray_244 = "#928374", -- 146-131-116

	bright_red = "#fb4934", -- 251-73-52
	bright_green = "#b8bb26", -- 184-187-38
	bright_yellow = "#fabd2f", -- 250-189-47
	bright_blue = "#83a598", -- 131-165-152
	bright_purple = "#d3869b", -- 211-134-155
	bright_aqua = "#8ec07c", -- 142-192-124
	bright_orange = "#fe8019", -- 254-128-25

	neutral_red = "#cc241d", -- 204-36-29
	neutral_green = "#98971a", -- 152-151-26
	neutral_yellow = "#d79921", -- 215-153-33
	neutral_blue = "#458588", -- 69-133-136
	neutral_purple = "#b16286", -- 177-98-134
	neutral_aqua = "#689d6a", -- 104-157-106
	neutral_orange = "#d65d0e", -- 214-93-14

	faded_red = "#9d0006", -- 157-0-6
	faded_green = "#79740e", -- 121-116-14
	faded_yellow = "#b57614", -- 181-118-20
	faded_blue = "#076678", -- 7-102-120
	faded_purple = "#8f3f71", -- 143-63-113
	faded_aqua = "#427b58", -- 66-123-88
	faded_orange = "#af3a03", -- 175-58-3

	light0_hard = "#f9f5d7", -- 249-245-215
	light0 = "#fbf1c7", -- 253-244-193
	light0_soft = "#f2e5bc", -- 242-229-188
	light1 = "#ebdbb2", -- 235-219-178
	light2 = "#d5c4a1", -- 213-196-161
	light3 = "#bdae93", -- 189-174-147
	light4 = "#a89984", -- 168-153-132
	light4_256 = "#a89984", -- 168-153-132
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
	set_highlight("Constant", { fg = colors.bright_red })
	set_highlight("String", { fg = colors.bright_green })
	set_highlight("Function", { fg = colors.bright_blue })
	set_highlight("Identifier", { fg = colors.bright_purple })
	set_highlight("Statement", { fg = colors.bright_yellow })
	set_highlight("Type", { fg = colors.bright_aqua })

	-- Keywords
	set_highlight("Keyword", { fg = colors.bright_orange }) -- Resaltado para palabras reservadas

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
