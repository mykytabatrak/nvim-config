local function config()
  local telescope = require("telescope")
  local themes = require("telescope.themes")

  telescope.setup({
    defaults = themes.get_dropdown({
      wrap_results = true,
      layout_strategy = "vertical",
      layout_config = {
        height = 0.99,
        width = 0.99,
        prompt_position = "top",
      },
    }),
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
  local utils = require("telescope.utils")

  local function find_config_files()
    builtin.find_files({
      cwd = vim.fn.stdpath("config"),
    })
  end
  local function find_open_files()
    builtin.buffers({
      sort_lastused = true,
      sort_mru = true,
      show_all_buffers = false,
    })
  end
  local function find_relative_files()
    builtin.find_files({
      cwd = utils.buffer_dir(),
    })
  end

  local function set_keymap(lhs, rhs, desc)
    vim.keymap.set("n", "<leader>" .. lhs, rhs, { desc = desc })
  end

  set_keymap("fc", find_config_files, "[F]ind [C]onfig")
  set_keymap("fh", builtin.help_tags, "[F]ind [H]elp")
  set_keymap("fk", builtin.keymaps, "[F]ind [K]eymaps")
  set_keymap("fw", builtin.live_grep, "[F]ind [W]ord")
  set_keymap("fW", builtin.grep_string, "[F]ind current [W]ord")
  set_keymap("fq", builtin.quickfix, "[F]ind [Q]uickfix")

  set_keymap("ffw", builtin.find_files, "[F]ind [F]iles in [W]orkspace")
  set_keymap("ffo", find_open_files, "[F]ind [F]iles [O]pen")
  set_keymap("<Tab>", find_open_files, "[F]ind [F]iles [O]pen")
  set_keymap("ffp", builtin.oldfiles, "[F]ind [P]revious")
  set_keymap("ffr", find_relative_files, "[F]ind [F]iles [R]elative")

  set_keymap("fgc", builtin.git_commits, "[F]ind [G]it [C]ommits")
  set_keymap("fgb", builtin.git_branches, "[F]ind [G]it [B]ranches")
  set_keymap("fgs", builtin.git_status, "[F]ind [G]it [S]status")
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
