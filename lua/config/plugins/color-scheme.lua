local function config()
  vim.cmd.colorscheme("tokyonight")
end

return {
  {
    "folke/tokyonight.nvim",
    config = config,
  },
}
