local bufdel_status_ok, bufdel = pcall(require, "bufdel")
if not bufdel_status_ok then
	return
end

bufdel.setup({
	next = "tabs",
	quit = true,
})
