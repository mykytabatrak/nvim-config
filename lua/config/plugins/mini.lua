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
end

return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = config,
  },
}
