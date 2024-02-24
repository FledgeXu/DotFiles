if vim.g.neovide then
    vim.o.guifont = "Cascadia Mono PL:h15:l"
    vim.g.neovide_transparency = 0.95
    vim.g.transparency = 0.95
    -- vim.g.neovide_no_idle = true
    vim.g.neovide_input_macos_alt_is_meta = true
    vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
    vim.keymap.set({ "n", "v", "i", "c" }, "<D-s>", ":w<CR>") -- Save
    vim.keymap.set({ "n", "v" }, "<D-c>", '"+y') -- Copy
    vim.keymap.set({ "i", "c" }, "<D-v>", "<c-r>+") -- Copy
    vim.keymap.set({ "n" }, "<D-v>", '"+p') -- Copy
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_refresh_rate = 120
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_hide_mouse_when_typing = true

    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function()
        change_scale_factor(1.25)
    end)
    vim.keymap.set("n", "<C-->", function()
        change_scale_factor(1 / 1.25)
    end)
end
