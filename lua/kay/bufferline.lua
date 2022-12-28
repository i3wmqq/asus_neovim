local bufferline_status_ok, bufferline = pcall(require, "bufferline")
if not bufferline_status_ok then
	return
end

bufferline.setup({
	options = {
		indicator = {
			icon = "",
			style = "none",
		},
		numbers = "none",
		close_command = "BufDel",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				separator = true,
			},
		},
		show_buffer_icons = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = false,
		separator_style = { "⏽", "⏽" },
		enforce_regular_tabs = true,
		always_show_bufferline = true,
	},
	highlights = {
		separator = {
			fg = "#8aadf4",
		},
		buffer_selected = {
			fg = "#8aadf4",
			italic = false,
		},
	},
})
