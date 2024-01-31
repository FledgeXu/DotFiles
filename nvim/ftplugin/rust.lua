local cmake = vim.fs.find('Cargo.toml', { upward = true })
if next(cmake) ~= nil then
    vim.opt.makeprg = [[cargo build]]
end
