-- lazy.nvim
return {
  "sbdchd/neoformat",
  config = function()

    -- Попробовать все форматтеры по порядку
    vim.g.neoformat_try_formatprg = 1

    -- Включить выравнивание
    vim.g.neoformat_basic_format_align = 1

    -- Включить преобразование табов в пробелы
    vim.g.neoformat_basic_format_retab = 1

    -- Удалять пробелы в конце строк
    vim.g.neoformat_basic_format_trim = 1
  end
}
