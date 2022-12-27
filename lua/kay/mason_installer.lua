local mason_installer_status_ok, mason_installer = pcall(require, "mason-tool-installer")
if not mason_installer_status_ok then
	return
end

mason_installer.setup({
	ensure_installed = {
		"lua-language-server",
		"stylua",
		"clangd",
		"clang-format",
		"bash-language-server",
		"shfmt",
		"marksman",
		"prettierd",
	},
	auto_update = true,
	run_on_start = true,
	start_delay = 3000,
})
