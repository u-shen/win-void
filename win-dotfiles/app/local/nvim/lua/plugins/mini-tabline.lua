-----------------------------------------------------------
-- Mini-Surround
-----------------------------------------------------------
return {
  'echasnovski/mini.tabline',
  version = '*',
  event = "VeryLazy",
  config = function()
    require('mini.tabline').setup()
    vim.api.nvim_set_hl(0, "MiniTablineFill", { link = "Normal" })
    vim.api.nvim_set_hl(0, "MiniTablineCurrent", { link = "NormalFloat" })
    vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "Comment" })
    vim.api.nvim_set_hl(0, "MiniTablineHidden", { link = "Comment" })
  end
}
