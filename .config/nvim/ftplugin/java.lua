if next(vim.fs.find("gradlew", { upward = true, stop = vim.fn.getcwd() })) ~= nil then
    vim.opt.makeprg = [[./gradlew build]]
end
local config = {
    cmd = { "jdtls" },
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)
