if next(vim.fs.find({ ".nvim.lua", ".nvimrc", ".exrc" })) == nil then
    require('dap-python').setup()
    require('dap-python').test_runner = 'pytest'
end
