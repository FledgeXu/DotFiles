return {
    "goolord/alpha-nvim",
    config = function()
        local alpha = require("alpha")
        local theta = require("alpha.themes.theta")
        local dashboard = require("alpha.themes.dashboard")
        table.insert(theta.buttons.val,
            dashboard.button("SPC q s", "󰑓  Restore the session", [[<cmd>lua require("persistence").load()<cr>]]))
        alpha.setup(theta.config)
    end
}
