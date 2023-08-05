return {
      {
    -- rose pine theme
    'rose-pine/neovim',
    priority = 1000,
    config = function()
      require('rose-pine').setup({
        variant = 'main'
      })
      vim.cmd.colorscheme 'rose-pine'
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,
  },
}
