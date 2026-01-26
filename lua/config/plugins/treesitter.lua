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

local function context_config()
  local context = require("treesitter-context")

  context.setup({
    max_lines = 3,
  })
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = config,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = context_config,
  },
}
