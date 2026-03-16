return {
  "github/copilot.vim",
  config = function()
    -- Базовые настройки copilot.vim
    vim.g.copilot_no_tab_map = true  -- Отключаем привязку к Tab
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_tab_fallback = ""  -- Отключаем fallback

    -- Кастомные хоткеи (пример)
    vim.api.nvim_set_keymap("i", "<CR>", 'copilot#Accept("\\<CR>")', {
      silent = true,
      expr = true,
      script = true,
      replace_keycodes = false
    })

    vim.api.nvim_set_keymap("i", "<C-]>", "<Cmd>call copilot#Dismiss()<CR>", { silent = true })
  end
}
