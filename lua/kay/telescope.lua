local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

require("telescope").load_extension("media_files")

telescope.setup({
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg", "mp4" },
			find_cmd = "fd",
		},
	},
	defaults = {
		file_ignore_patterns = { ".git/", "./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*" },
	},
})
