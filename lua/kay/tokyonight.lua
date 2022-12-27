local tokyonight_status_ok, tokyonight = pcall(require, "tokyonight")
if not tokyonight_status_ok then
	return
end

tokyonight.setup({
	style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
	transparent = true, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		comments = "NONE",
		keywords = "NONE",
		functions = "NONE",
		variables = "NONE",
		sidebars = "transparent", -- style for sidebars, see below
		floats = "transparent", -- style for floating windows
	},
	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = true, -- dims inactive windows
	lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
})

vim.cmd([[colorscheme tokyonight]])
