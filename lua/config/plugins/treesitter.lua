local function config()
  local configs = require("nvim-treesitter.configs")

  ---@diagnostic disable-next-line: missing-fields
  configs.setup({
    ensure_installed = { "lua", "javascript", "typescript" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
    },
  })
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = config,
  },
}
