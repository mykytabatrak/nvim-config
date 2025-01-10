local function config()
  vim.fn.sign_define(
    "DiagnosticSignError",
    { text = " ", texthl = "DiagnosticSignError" }
  )
  vim.fn.sign_define(
    "DiagnosticSignWarn",
    { text = " ", texthl = "DiagnosticSignWarn" }
  )
  vim.fn.sign_define(
    "DiagnosticSignInfo",
    { text = " ", texthl = "DiagnosticSignInfo" }
  )
  vim.fn.sign_define(
    "DiagnosticSignHint",
    { text = "󰌵", texthl = "DiagnosticSignHint" }
  )

  require("neo-tree").setup({
    window = {
      position = "current",
    },
  })
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    keys = {
      {
        "\\",
        ":Neotree source=last<CR>",
        desc = "NeoTree reveal",
        silent = true,
      },
    },
    config = config,
  },
}
