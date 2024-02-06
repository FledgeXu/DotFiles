if next(vim.fs.find({ ".nvim.lua", ".nvimrc", ".exrc" }, { upward = true, stop = vim.fn.getcwd() })) == nil then
    require('dap-python').setup()
    require('dap-python').test_runner = 'pytest'
end
