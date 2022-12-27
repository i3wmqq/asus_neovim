local nullls_status_ok, nullls = pcall(require, "null-ls")
if not nullls_status_ok then
	return
end

nullls.setup({
	sources = {
		nullls.builtins.formatting.stylua,
		nullls.builtins.formatting.shfmt,
		nullls.builtins.formatting.clang_format,

		-- nullls.builtins.diagnostics.eslint_d.with({
		-- 	diagnostic_config = {
		-- 		underline = false,
		-- 		signs = true,
		-- 		virtual_text = false,
		-- 		severity_sort = true,
		-- 	},
		-- }),
	},
})
