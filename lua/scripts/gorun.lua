local uv = vim.loop
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

-- Проверка расширения файла
local function is_go_file(filename)
  return filename:match("%.go$")
end

-- Чтение первой строки файла
local function read_first_line(path)
  local fd = uv.fs_open(path, "r", 438) -- 438 = 0666 в восьмеричной системе
  if not fd then return nil end
  local data = uv.fs_read(fd, 1024, 0)
  uv.fs_close(fd)
  if not data then return nil end
  local first_line = data:match("([^\r\n]+)")
  return first_line
end

-- Рекурсивный обход всех папок и файлов без исключений
local function scan_go_main_files(path, results)
  results = results or {}

  local handle = uv.fs_scandir(path)
  if not handle then
    -- Не можем открыть директорию (например, права доступа), пропускаем
    return results
  end

  while true do
    local name, type = uv.fs_scandir_next(handle)
    if not name then break end

    local full_path = path .. "/" .. name

    -- Если тип не определён, получаем через stat
    if not type then
      local stat = uv.fs_stat(full_path)
      if stat then
        type = stat.type
      end
    end

    if type == "directory" then
      -- Рекурсивно обходим вложенную папку
      scan_go_main_files(full_path, results)
    elseif type == "file" and is_go_file(name) then
      local first_line = read_first_line(full_path)
      if first_line == "package main" then
        table.insert(results, full_path)
      end
    end
  end

  return results
end

-- Запуск go run с выбранным файлом
local function gorun(filepath)
  vim.cmd('normal ;;')
  local cmd = "go run " .. filepath
  local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)
  vim.fn.feedkeys(cmd .. enter, 'n')
end

-- Telescope picker для выбора Go main файлов
local function go_main_picker()
  local results = scan_go_main_files(vim.fn.getcwd())

  pickers.new({}, {
    prompt_title = "Go Main Files",
    finder = finders.new_table {
      results = results
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      local function on_select()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        -- Копируем путь в буфер обмена
        vim.fn.setreg('+', selection[1])
        print("Copied to clipboard: " .. selection[1])
        -- Запускаем go run с выбранным файлом
        gorun(selection[1])
      end
      map('i', '<CR>', on_select)
      map('n', '<CR>', on_select)
      return true
    end,
  }):find()
end

-- Кеймап для вызова из нормального режима
vim.keymap.set('n', ';s', go_main_picker, { noremap = true, silent = true, desc = "Telescope Go Main files" })
return {
  scan_go_main_files = scan_go_main_files,
  gorun = gorun,
  go_main_picker = go_main_picker,
}

