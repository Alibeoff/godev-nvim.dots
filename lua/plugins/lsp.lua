return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      -- Дополнительно включить виртуальный текст с отступами
      vim.diagnostic.config({
        virtual_text = {
          prefix = "",
          spacing = 6, -- табуляция перед текстом ошибки
        },
      })

      vim.keymap.set("n", "sa", function()
        vim.lsp.buf.code_action({ filters = { include = { "source.addImport", "source.OrganizeImports" }, } })
      end, { desc = "Go: Organize Imports" })
    end,

  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "gopls", "jsonls", "yamlls", "dockerls", "cssls", "html", "docker_compose_language_service" },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      }
    }
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- Отступы в окне trouble
      padding = false,
      indent_lines = true,
    },
  }
}
