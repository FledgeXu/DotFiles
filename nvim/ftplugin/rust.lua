if next(vim.fs.find('Cargo.toml', { upward = true, stop = vim.fn.getcwd() })) ~= nil then
    vim.opt.makeprg = [[cargo build]]
    vim.cmd [[
    " Copied from built-in compiler/{rustc,cargo}.vim
setlocal errorformat=
			\%f:%l:%c:\ %t%*[^:]:\ %m,
			\%f:%l:%c:\ %*\\d:%*\\d\ %t%*[^:]:\ %m,
			\%-G%f:%l\ %s,
			\%-G%*[\ ]^,
			\%-G%*[\ ]^%*[~],
			\%-G%*[\ ]...

" New errorformat (after nightly 2016/08/10)
setlocal errorformat+=
			\%-G,
			\%-Gerror:\ aborting\ %.%#,
			\%-Gerror:\ Could\ not\ compile\ %.%#,
			\%Eerror:\ %m,
			\%Eerror[E%n]:\ %m,
			\%Wwarning:\ %m,
			\%Inote:\ %m,
			\%C\ %#-->\ %f:%l:%c

setlocal errorformat+=
			\%-G%\\s%#Downloading%.%#,
			\%-G%\\s%#Compiling%.%#,
			\%-G%\\s%#Finished%.%#,
			\%-G%\\s%#error:\ Could\ not\ compile\ %.%#,
			\%-G%\\s%#To\ learn\ more\\,%.%#
    ]]
end

if next(vim.fs.find({ ".nvim.lua", ".nvimrc", ".exrc" })) == nil then
    local dap = require('dap')
    dap.adapters.lldb = {
        type = 'executable',
        command = vim.fs.find("lldb-vscode", { path = "/opt/homebrew/Cellar/llvm/" })[1],
        name = 'lldb'
    }
    dap.configurations.cpp = {
        {
            name = 'Launch',
            type = 'lldb',
            request = 'launch',
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
            initCommands = function()
                -- Find out where to look for the pretty printer Python module
                local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

                local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
                local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

                local commands = {}
                local file = io.open(commands_file, 'r')
                if file then
                    for line in file:lines() do
                        table.insert(commands, line)
                    end
                    file:close()
                end
                table.insert(commands, 1, script_import)

                return commands
            end,
        },
    }
end
