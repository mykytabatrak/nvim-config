local function config()
  local telescope = require("telescope")

  telescope.setup({})

  telescope.load_extension("fzf")
  telescope.load_extension("ui-select")

  local builtin = require("telescope.builtin")
  local utils = require("telescope.utils")

  local function set_telescop_keymap(lhs, rhs, desc)
    vim.keymap.set(
      "n",
      "<leader>" .. lhs,
      rhs,
      { desc = "Telescope: " .. desc }
    )
  end

  set_telescop_keymap("fk", builtin.keymaps, "Find keymaps")
  set_telescop_keymap("fw", builtin.live_grep, "Find word")
  set_telescop_keymap("fW", builtin.grep_string, "Find current word")

  set_telescop_keymap("ff", builtin.find_files, "Find files")
  set_telescop_keymap("<Tab>", function()
    builtin.buffers({
      sort_lastused = true,
      sort_mru = true,
      show_all_buffers = false,
    })
  end, "Find open files")
  set_telescop_keymap("fp", builtin.oldfiles, "Find recent files")
  set_telescop_keymap("fr", function()
    builtin.find_files({
      cwd = utils.buffer_dir(),
    })
  end, "Find files in current directory")

  set_telescop_keymap("fgc", builtin.git_commits, "Find git commits")
  set_telescop_keymap("fgb", builtin.git_branches, "Find git branches")
  set_telescop_keymap("fgs", builtin.git_status, "Find git changes")
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
