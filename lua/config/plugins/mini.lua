local function config()
  require("mini.statusline").setup({ use_icons = true })
  require("mini.ai").setup({ n_lines = 500 })
  require("mini.surround").setup()
  require("mini.bracketed").setup({
    buffer = { suffix = "b", options = {} },
    comment = { suffix = "" },
    conflict = { suffix = "" },
    diagnostic = { suffix = "" },
    file = { suffix = "" },
    indent = { suffix = "" },
    jump = { suffix = "" },
    location = { suffix = "" },
    oldfile = { suffix = "" },
    quickfix = { suffix = "" },
    treesitter = { suffix = "" },
    undo = { suffix = "" },
    window = { suffix = "" },
    yank = { suffix = "" },
  })

  MiniFiles = require("mini.files")
  MiniFiles.setup()

  local minifiles_toggle = function()
    if not MiniFiles.close() then
      MiniFiles.open(vim.api.nvim_buf_get_name(0))
    end
  end

  vim.keymap.set(
    "n",
    "<leader>fe",
    minifiles_toggle,
    { desc = "[F]ile [E]xplorer" }
  )
end

return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = config,
  },
}
