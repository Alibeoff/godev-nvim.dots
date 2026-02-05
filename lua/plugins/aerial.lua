-- lua/plugins/aerial.lua
return {
  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    keys = {
      { "sl", "<cmd>AerialToggle<CR>", desc = "Toggle outline (keep focus)" },
      { "[[", "<cmd>AerialPrev<CR>", desc = "Prev symbol" },
      { "]]", "<cmd>AerialNext<CR>", desc = "Next symbol" },
    },
    opts = {
      -- Позиция и размер
      layout = {
        max_width = { 40, 0.3 }, -- Макс 40 символов или 30% экрана
        min_width = 25, -- Минимальная ширина
        default_direction = "prefer_right", -- right, left, float
        placement = "edge", -- edge, window
        resize_to_content = true, -- Автоподгонка ширины
      },
      
      -- Какие символы показывать
      filter_kind = {
        "Class",
        "Constructor",
        "Enum", 
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        "Package",
        "Property",
        "Struct",
        "Trait",
      },
      
      -- Внешний вид
      show_guides = true, -- Показывать направляющие линии
      guides = {
        mid_item = "├─",
        last_item = "└─",
        nested_top = "│ ",
        whitespace = "  ",
      },
      
      -- Подсветка и цвета
      highlight_on_hover = true, -- Подсвечивать при наведении
      highlight_mode = "split_width", -- whole_line, split_width
      highlight_closest = true, -- Автоподсветка ближайшего символа
      
      -- Поведение
      close_behavior = "global", -- auto, close, global
      close_on_select = true, -- Закрывать при выборе символа
      link_tree_to_folds = true, -- Связывать с фолдами
      link_folds_to_tree = false, -- Не наоборот (опционально)
      
      -- Фолды
      manage_folds = false, -- Автоматическое управление фолдами
      
      -- Окно
      float = {
        border = "rounded", -- rounded, single, double, solid, none
        max_height = 0.9,
        min_height = 0.2,
        relative = "cursor", -- cursor, editor, win
      },
      
      -- Иконки
      nerd_font = "auto", -- auto, always, never
      icons = {
        Array = "",
        Boolean = "",
        Class = "ﴯ",
        Constant = "",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "",
        Field = "ﰠ",
        File = "",
        Function = "",
        Interface = "",
        Key = "",
        Method = "",
        Module = "",
        Namespace = "",
        Null = "ﳠ",
        Number = "",
        Object = "",
        Operator = "",
        Package = "",
        Property = "ﰠ",
        String = "",
        Struct = "פּ",
        TypeParameter = "",
        Variable = "",
      },
      
      -- Привязки клавиш (копируем из symbols-outline где возможно)
      keymaps = {
        ["ll"] = "actions.jump",
        ["<CR>"] = "actions.jump", -- перейти по названию
        ["<C-v>"] = "actions.jump_vsplit",
        ["<C-s>"] = "actions.jump_split",
        ["o"] = "actions.tree_toggle",
        ["O"] = "actions.tree_toggle_recursive",
        ["h"] = "actions.tree_close",
        ["l"] = "actions.tree_open",
        ["W"] = "actions.tree_close_all",
        ["E"] = "actions.tree_open_all",
        ["K"] = "actions.toggle_preview",
        ["<S-space>"] = "actions.hover",
        ["?"] = "actions.show_help",
        ["q"] = "actions.close",
        ["<Esc>"] = "actions.close",
        ["<Tab>"] = "actions.toggle_collapse",
      },
    },
    
    config = function(_, opts)
      -- Настройка aerial
      require("aerial").setup(opts)
      
      -- Автокоманды для лучшего UX
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "aerial",
        callback = function()
          -- Настройки для буфера aerial
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.opt_local.signcolumn = "no"
          vim.opt_local.winhighlight = "Normal:AerialNormal,EndOfBuffer:AerialNormal"
        end,
      })
      
    -- Интеграция с LSP - автоматическое открытие aerial
    -- vim.api.nvim_create_autocmd("LspAttach", {
    --   callback = function(args)
    --     local bufnr = args.buf
    --     local client = vim.lsp.get_client_by_id(args.data.client_id)
    --
    --     if client and client.supports_method("textDocument/documentSymbol") then
    --       -- Определяем для каких типов файлов открывать автоматически
    --       local filetype = vim.bo[bufnr].filetype
    --       local auto_open_ft = {
    --         "python", "javascript", "typescript", "lua", 
    --         "go", "rust", "java", "cpp", "c", "cs",
    --         "php", "ruby", "kotlin", "scala", "swift",
    --       }
    --
    --       -- Если файл в списке, открываем aerial
    --       if vim.tbl_contains(auto_open_ft, filetype) then
    --         -- Ждем немного, чтобы LSP успел проанализировать файл
    --         vim.defer_fn(function()
    --           require("aerial").open()
    --         end, 500) -- 0.5 секунды задержки
    --       end
    --     end
    --   end,
    -- })
  end,
    -- Опциональные зависимости для лучшей интеграции
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
