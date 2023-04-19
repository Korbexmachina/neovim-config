 return {
     "goolord/alpha-nvim",
     config = function ()
         local alpha = require'alpha'
         local dashboard = require'alpha.themes.dashboard'
         dashboard.section.header.val = {
             [[                               __                ]],
             [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
             [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
             [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
             [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
             [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
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
            dashboard.section.footer.val = { " ", " ", " ", "Neovim loaded " .. stats.count .. " plugins   in " .. time .. "ms" }
            dashboard.section.footer.opts.hl = "DashboardFooter"
            end,
        })
         dashboard.config.opts.noautocmd = true
         vim.cmd[[autocmd User AlphaReady echo 'ready']]
         alpha.setup(dashboard.config)
     end
 }
