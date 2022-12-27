local spectre_status_ok, spectre = pcall(require, "spectre")
if not spectre_status_ok then
	return
end

spectre.setup({})
