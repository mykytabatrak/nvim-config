local function config()
  local telescope = require("telescope")
  local themes = require("telescope.themes")

  telescope.setup({
    defaults = themes.get_ivy(),
    extensions = {
      fzf = {},
      ["ui-select"] = {
        themes.get_dropdown(),
      },
    },
  })

  telescope.load_extension("fzf")
  telescope.load_extension("ui-select")

  local builtin = require("telescope.builtin")

  local function find_config_files()
    builtin.find_files({
      cwd = vim.fn.stdpath("config"),
    })
  end
  local function find_open()
    builtin.buffers({
      sort_lastused = true,
      sort_mru = true,
      show_all_buffers = false,
    })
  end

  local function set_keymap(lhs, rhs, desc)
    vim.keymap.set("n", "<leader>" .. lhs, rhs, { desc = desc })
  end

  set_keymap("ff", builtin.find_files, "[F]ind [F]iles")
  set_keymap("fc", find_config_files, "[F]ind [C]onfig")
  set_keymap("fh", builtin.help_tags, "[F]ind [H]elp")
  set_keymap("fk", builtin.keymaps, "[F]ind [K]eymaps")
  set_keymap("fw", builtin.live_grep, "[F]ind [W]ord")
  set_keymap("fcw", builtin.grep_string, "[F]ind [C]urrent [W]ord")
  set_keymap("fd", builtin.diagnostics, "[F]ind [D]iagnostics")
  set_keymap("fr", builtin.oldfiles, "[F]ind [R]ecent")
  set_keymap("fo", find_open, "[F]ind [O]pen")
  set_keymap("fgc", builtin.git_commits, "[F]ind [G]it [C]ommits")
  set_keymap("fgb", builtin.git_branches, "[F]ind [G]it [B]ranches")
  set_keymap("fgs", builtin.git_stash, "[F]ind [G]it [S]status")
end

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-lua/plenary.nvim" },
      { "sharkdp/fd" },
    },
    config = config,
  },
}
