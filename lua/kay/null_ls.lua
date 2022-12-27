local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		formatting.stylua.with({
			name = "lua_format",
			filetyles = { "lua" },
			methods = { "formatting" },
			command = "stylua",
		}),
		formatting.clang_format.with({
			name = "clang_format",
			filetypes = { "c", "cpp" },
			methods = { "formatting" },
			command = "clang-format",
		}),
		formatting.shfmt.with({
			name = "bash_format",
			filetypes = { "sh" },
			methods = { "formatting" },
			command = "shfmt",
		}),
		formatting.prettierd.with({
			name = "prettier",
			filetypes = { "markdown", "yaml", "json", "html", "css", "typescipt", "javascript" },
			methods = { "formatting" },
			command = "prettierd",
		}),

		-- null_ls.builtins.diagnostics.eslint_d.with({
		-- 	diagnostic_config = {
		-- 		underline = false,
		-- 		signs = true,
		-- 		virtual_text = false,
		-- 		severity_sort = true,
		-- 	},
		-- }),
	},
})
