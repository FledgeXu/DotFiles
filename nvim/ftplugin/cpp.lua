-- Set up make args
if next(vim.fs.find('CMakeLists.txt', { upward = true })) ~= nil then
    vim.opt.makeprg = [[cmake --build build]]
end

-- Config Default dap.
if next(vim.fs.find({ ".nvim.lua", ".nvimrc", ".exrc" })) == nil then
    local dap = require('dap')
    dap.adapters.lldb = {
        type = 'executable',
        command = '/opt/homebrew/Cellar/llvm/17.0.6_1/bin/lldb-vscode', -- adjust as needed, must be absolute path
        name = 'lldb'
    }

    dap.configurations.cpp = {
        {
            name = 'Launch',
            type = 'lldb',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = function()
                return { vim.fn.input("program args: ") }
            end
        },
    }
end
