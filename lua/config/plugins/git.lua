local function config()
  require("gitsigns").setup()
end

return {
  {
    "lewis6991/gitsigns.nvim",
    config = config,
  },
  {
    "sindrets/diffview.nvim",
  },
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
    },
    cmd = "Neogit",
  },
}
