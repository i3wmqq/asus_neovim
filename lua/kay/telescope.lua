local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

telescope.load_extension("media_files")
telescope.load_extension("software-licenses")
telescope.load_extension("emoji")

telescope.setup({
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "fd",
		},
	},
	defaults = {
		file_ignore_patterns = { ".git/", "./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*" },
	},
})
