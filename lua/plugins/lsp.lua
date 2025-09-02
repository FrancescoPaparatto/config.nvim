return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "gopls",
        "rust_analyzer",
        "clangd",
        "bashls",
      },

      handlers = {
        function(server_name)
          local capabilities = require("blink.cmp").get_lsp_capabilities()
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      },

      ["gopls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.gopls.setup({
          capabilities = capabilities,
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
            },
          },
        })
      end,

      ["pyright"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.pyright.setup({
          capabilities = capabilities,
          settings = {
            pyright = {
              -- Using Ruff's import organizer
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { "*" },
              },
            },
          },
        })
        lspconfig.ruff.setup({})
      end,
    })

    vim.diagnostic.config({
      virtual_text = true, -- inline errors
      signs = true,     -- gutter signs
      underline = true, -- underline problematic text
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        ---@diagnostic disable-next-line: assign-type-mismatch
        source = "always",
        header = "",
        prefix = "",
      },                 -- pretty floating window

      severity_sort = true, -- sort by severity
    })

    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end)
    vim.keymap.set("n", "<leader>gd", function()
      vim.lsp.buf.definition()
    end)
    vim.keymap.set("n", "<leader>gr", function()
      vim.lsp.buf.references()
    end)
    vim.keymap.set("n", "<space>cf", function()
      vim.lsp.buf.format()
    end)
    vim.keymap.set("n", "<space>ca", function()
      vim.lsp.buf.code_action()
    end)
  end,
}
