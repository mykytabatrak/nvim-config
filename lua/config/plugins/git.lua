local function config()
  require("gitsigns").setup()
end

return {
  {
    "lewis6991/gitsigns.nvim",
    config = config,
  },
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    cmd = "Neogit",
  },
}
