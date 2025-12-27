local function config()
  require("mini.ai").setup()
  require("mini.pairs").setup()
  require("mini.surround").setup()

  require("mini.statusline").setup({ use_icons = true })
  require("mini.bracketed").setup()
  require("mini.files").setup()
  require("mini.tabline").setup()

  vim.keymap.set("n", "<leader>fe", function()
    local miniFiles = require("mini.files")

    if not miniFiles.close() then
      miniFiles.open(vim.api.nvim_buf_get_name(0))
    end
  end, { desc = "Mini: Open file explorer" })
end

return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = config,
  },
}
