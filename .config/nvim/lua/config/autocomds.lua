vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.api.nvim_create_user_command("UpdateAll", function()
	vim.cmd("Lazy update")
	vim.cmd("MasonUpdate")
end, {})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd([[clearjumps]])
	end,
	pattern = "*",
})

vim.api.nvim_create_autocmd("filetype", {
	pattern = "netrw",
	callback = function()
		vim.keymap.set("n", "q", "<cmd>q<CR>", { buffer = true })
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local bufnr = args.buf
		if client:supports_method("textDocument/implementation") then
			-- Create a keymap for vim.lsp.buf.implementation ...
		end
		-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|

		-- if client:supports_method("textDocument/completion") then
		-- 	-- Optional: trigger autocompletion on EVERY keypress. May be slow!
		-- 	-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
		-- 	-- client.server_capabilities.completionProvider.triggerCharacters = chars
		-- 	vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		-- end

		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		if
			not client:supports_method("textDocument/willSaveWaitUntil")
			and client:supports_method("textDocument/formatting")
		then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("my.lsp.format." .. bufnr, { clear = true }),
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})
