if next(vim.fs.find('Cargo.toml', { upward = true, stop = vim.fn.getcwd() })) ~= nil then
    vim.cmd [[compiler cargo]]
    vim.opt.makeprg = [[cargo build]]
end

if require('dap').configurations.rust == nil then
    local dap = require('dap')
    -- dap.adapters.lldb = {
    --     type = 'executable',
    --     command = vim.fs.find("lldb-vscode", { path = "/opt/homebrew/Cellar/llvm/" })[1],
    --     name = 'lldb'
    -- }
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
    dap.configurations.rust = {
        {
            name = 'Default',
            type = 'codelldb',
            request = 'launch',
            console = "integratedTerminal",
            program = function()
                -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
                return vim.fn.getcwd() ..
                    '/target/debug/' ..
                    vim.fn.system({ "rg", "-o", 'name[[:space:]]*=[[:space:]]*"(.*)"', "Cargo.toml", "-r", "$1" }):gsub(
                        "%s+", "")
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = function()
                return { vim.fn.input("Program args: ") }
            end,
            -- initCommands = function()
            --     -- Find out where to look for the pretty printer Python module
            --     local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))
            --
            --     local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
            --     local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'
            --
            --     local commands = {}
            --     local file = io.open(commands_file, 'r')
            --     if file then
            --         for line in file:lines() do
            --             table.insert(commands, line)
            --         end
            --         file:close()
            --     end
            --     table.insert(commands, 1, script_import)
            --
            --     return commands
            -- end,
        },
    }
end
