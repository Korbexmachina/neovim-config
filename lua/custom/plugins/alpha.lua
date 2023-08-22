return {
    "goolord/alpha-nvim",
    config = function ()
        local alpha = require'alpha'
        local dashboard = require'alpha.themes.dashboard'
        dashboard.section.header.val = {
            [[ __                     __                                                 ]],
            [[/\ \                   /\ \                              __                ]],
            [[\ \ \/'\     ___   _ __\ \ \____     __    ___   __  __ /\_\    ___ ___    ]],
            [[ \ \ , <    / __`\/\`'__\ \ '__`\  /'__`\/' _ `\/\ \/\ \\/\ \ /' __` __`\  ]],
            [[  \ \ \\`\ /\ \L\ \ \ \/ \ \ \L\ \/\  __//\ \/\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[   \ \_\ \_\ \____/\ \_\  \ \_,__/\ \____\ \_\ \_\ \___/  \ \_\ \_\ \_\ \_\]],
            [[    \/_/\/_/\/___/  \/_/   \/___/  \/____/\/_/\/_/\/__/    \/_/\/_/\/_/\/_/]],
        }
        dashboard.section.buttons.val = {
            dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
            dashboard.button("SPC s f", "  Search Files"),
            dashboard.button("SPC s g", "  Search by Grep"),
            dashboard.button("SPC s r", "  Recent Files"),
            dashboard.button("SPC ?", "󰋖  Search Help"),
            dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
        }
        vim.api.nvim_create_autocmd("UIEnter", {
            callback = function()
                local stats = require("lazy").stats()
                local time = math.floor(stats.startuptime * 100 + 0.5) / 100
                dashboard.section.footer.val = { " ", " ", " ", "Neovim loaded " .. stats.count .. " plugins  in " .. time .. "ms" }
                dashboard.section.footer.opts.hl = "DashboardFooter"
            end,
        })
        dashboard.config.opts.noautocmd = true
        dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
        dashboard.config.layout[3].val = 5
        vim.cmd[[autocmd User AlphaReady echo 'ready']]
        alpha.setup(dashboard.config)
    end
}
