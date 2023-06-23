if vim.g.neovide then
    vim.o.guifont = "Cascadia Code:h15"
    vim.g.transparency = 0.98
    vim.g.neovide_no_idle = true
    vim.g.neovide_input_macos_alt_is_meta = true
    vim.g.neovide_input_use_logo = 1          -- enable use of the logo (cmd) key
    vim.keymap.set('n', '<D-s>', ':w<CR>')    -- Save
    vim.keymap.set({ 'n', 'v' }, '<D-c>', '"+y') -- Copy
    vim.keymap.set({ 'i', 'c' }, '<D-v>', '<c-r>+') -- Copy
    vim.keymap.set({ 'n' }, '<D-v>', '"+p') -- Copy
    vim.g.neovide_padding_top = 48
    vim.g.neovide_padding_left = 4
    vim.g.neovide_padding_right = 4
    vim.g.neovide_padding_bottom = 4
    vim.g.neovide_confirm_quit = false
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_refresh_rate = 120
end
