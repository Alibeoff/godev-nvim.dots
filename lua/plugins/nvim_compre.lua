return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "onsails/lspkind.nvim",
    "ray-x/go.nvim",
  },
  config = function()
    -- Настройка nvim-cmp
    local cmp = require('cmp')
    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = "luasnip" },
        { name = 'nvim_lsp_signature_help' },
      },
      mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<Down>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<Up>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if cmp.get_selected_entry() then
              cmp.confirm()  -- Подтверждаем только если что-то выбрано
            else
              fallback()  -- Обычный Enter если ничего не выбрано
            end
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['kk'] = cmp.mapping(function()
          if not cmp.visible() then
            cmp.complete()
          end
        end, { 'i', 's' }),
      },
      formatting = {
        format = require('lspkind').cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
        })
      },
      completion = {
        completeopt = 'menu,menuone,noinsert,noselect',  -- Важно: noselect означает что ничего не выбрано по умолчанию
        keyword_length = 1,
      },
    })
    -- Опционально: настройка go.nvim для Go-разработки
    require('go').setup({
      auto_format = true,
      auto_lint = true,
      formatter = 'goimports',
    })
  end,
}
