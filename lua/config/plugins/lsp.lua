local function config()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
      local telescopeBuiltin = require("telescope.builtin")

      local function current_buf_diagnostic()
        telescopeBuiltin.diagnostics({
          bufnr = 0,
        })
      end

      vim.keymap.set(
        "n",
        "grd",
        telescopeBuiltin.lsp_definitions,
        { desc = "Go to [D]efinition" }
      )
      vim.keymap.set(
        "n",
        "grD",
        vim.lsp.buf.declaration,
        { desc = "Go to [D]eclaration" }
      )
      vim.keymap.set(
        "n",
        "grr",
        telescopeBuiltin.lsp_references,
        { desc = "Go to [R]eference" }
      )
      vim.keymap.set(
        "n",
        "gri",
        telescopeBuiltin.lsp_implementations,
        { desc = "Go to [I]mplementation" }
      )
      vim.keymap.set(
        "n",
        "grt",
        telescopeBuiltin.lsp_type_definitions,
        { desc = "Go to [T]ype definition" }
      )
      vim.keymap.set(
        "n",
        "go",
        telescopeBuiltin.lsp_document_symbols,
        { desc = "Go to document symbols" }
      )
      vim.keymap.set(
        "n",
        "gO",
        telescopeBuiltin.lsp_dynamic_workspace_symbols,
        { desc = "Go to workspace symbols" }
      )
      vim.keymap.set(
        "n",
        "gd",
        current_buf_diagnostic,
        { desc = "Go to document diagnostics" }
      )
      vim.keymap.set(
        "n",
        "gD",
        telescopeBuiltin.diagnostics,
        { desc = "Go to workspace diagnostics" }
      )

      -- Highlight references under cursor
      local client = vim.lsp.get_client_by_id(event.data.client_id)

      if
        client
        and client:supports_method(
          vim.lsp.protocol.Methods.textDocument_documentHighlight
        )
      then
        local highlight_augroup =
          vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd("LspDetach", {
          group = vim.api.nvim_create_augroup(
            "kickstart-lsp-detach",
            { clear = true }
          ),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({
              group = "lsp-highlight",
              buffer = event2.buf,
            })
          end,
        })
      end
    end,
  })

  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {},
    automatic_installation = true,
  })
  require("mason-tool-installer").setup({
    ensure_installed = { "stylua", "prettierd", "prettier" },
  })

  local capabilities = require("blink.cmp").get_lsp_capabilities()
  local lspconfig = require("lspconfig")

  lspconfig.lua_ls.setup({ capabilities = capabilities })
  lspconfig.ts_ls.setup({ capabilities = capabilities })
  lspconfig.eslint.setup({ capabilities = capabilities })
  lspconfig.typos_lsp.setup({ capabilities = capabilities })
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "saghen/blink.cmp",
      },
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    },
    config = config,
  },
}
