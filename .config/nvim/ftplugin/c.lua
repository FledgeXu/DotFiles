-- Set up make args
if next(vim.fs.find('CMakeLists.txt', { upward = true, stop = vim.fn.getcwd() })) ~= nil then
    vim.opt.makeprg = [[cmake --build build]]
end

-- Config Default dap.
if require('dap').configurations.cpp == nil then
    local dap = require('dap')
    dap.adapters.codelldb = {
        type = 'server',
        port = "${port}",
        executable = {
            -- CHANGE THIS to your path!
            command = 'codelldb',
            args = { "--port", "${port}" },
            -- On windows you may have to uncomment this:
            -- detached = false,
        }
    }
    dap.configurations.c = {
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
                return { vim.fn.input("Program args: ") }
            end
        },
    }
end
