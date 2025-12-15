local function config()
  vim.keymap.set(
    { "n", "v" },
    "<leader>xe",
    require("nvim-emmet").wrap_with_abbreviation
  )
end

return {
  {
    "olrtg/nvim-emmet",
    config = config,
  },
}
