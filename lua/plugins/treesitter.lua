return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    -- Установить без TSUpdate если есть проблемы
    local ts_install = require("nvim-treesitter.install")
    ts_install.update({ with_sync = true })()
  end,
  
  -- ВАЖНО: без event, без dependencies
  init = function()
    -- Отложить настройку
    vim.defer_fn(function()
      local ok, ts = pcall(require, "nvim-treesitter.configs")
      if ok then
        ts.setup({
          ensure_installed = { "go", "lua" },
          highlight = { enable = true },
          indent = { enable = true },
        })
        print("✅ Treesitter настроен")
      end
    end, 1000) -- Задержка 1 секунда
  end,
}
