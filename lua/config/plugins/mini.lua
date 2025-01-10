local function config()
  require("mini.statusline").setup({ use_icons = true })
  require("mini.ai").setup({ n_lines = 500 })
  require("mini.surround").setup()
end

return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = config,
  },
}
