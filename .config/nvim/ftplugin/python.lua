vim.o.makeprg = [[pyright ./**/*.py]]

if require("dap").configurations.python == nil then
    require("dap-python").setup()
    require("dap-python").test_runner = "pytest"
end

if next(vim.fs.find({ "pdm.lock" }, { upward = true, stop = vim.fn.getcwd() })) ~= nil then
    vim.opt.makeprg = [[(pyright ./**/*.py && pdm install)]]
end
