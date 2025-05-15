local set = vim.keymap.set
local builtin = require('telescope.builtin')


-- LSP
-- Кеймап sge для показа ошибок через Telescope
set('n', 'se', vim.diagnostic.open_float, { desc = "Show LSP diagnostic message" })
set('n', 'sge', function()
require('telescope.builtin').diagnostics()
end, { desc = "Show all LSP diagnostics with Telescope" })
set("n", "sl", "<cmd>SymbolsOutline<CR>", { desc = "Toggle Symbols Outline" })
-- Telescope
local telescope_builtin = require('telescope.builtin')
set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' })
set('n', '<leader>fw', telescope_builtin.live_grep, { desc = 'Telescope find words' })
set('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
-- Commenting
set("n", "<leader>/", "gcc", {desc = "Comment line", remap = true})
set("v", "<leader>/", "gc", {desc = "Comment lines", remap = true})

-- Normal Mode
set("i", "jj", "<Esc>", { noremap = true, silent = true })

set("n", "<leader>w", "<cmd>w<CR>", { noremap = true, silent = true })
set("n", "<leader>q", "<cmd>q<CR>", { noremap = true, silent = true })
--Vision Mode
set('v', '<Tab>', '>gv', { noremap = true, silent = true })
set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })
-- Терминал будет переключаться по <Space>tf и F7 - file term.lua
--Nvim.GO =}>=}>
set("n", "gt", "<cmd>GoAddTag<CR>", {desc = "Add Tag", silent = true}) 
set("n", "gm", "<cmd>GoRmTag<CR>", {desc = "Add Tag", silent = true}) 

-- Tree
set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Фокусируем NvimTree, если он открыт, иначе открываем
set("n", "<leader>o", function()
  local api = require("nvim-tree.api")
  if api.tree.is_visible() then
    -- Если дерево уже открыто, просто фокусируемся на нём
    api.tree.focus()
  else
    -- Если закрыто, открываем (можно и не открывать, если хочешь, чтобы только фокусировал)
    api.tree.open()
    api.tree.focus()
  end
end, { noremap = true, silent = true })
-- buffer line
-- Переключение на следующий буфер по Tab (в normal и terminal режиме)

set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
set("n", "<leader>c", "<cmd>bdelete<CR>", { desc = "Закрыть текущий буфер" })

set("t", "<Tab>", "<Tab>", { noremap = true, silent = true })
-- Anty Snippets
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  group = vim.api.nvim_create_augroup("GoErrorHandler", {}),
  callback = function()
    set("n", "ee", function()
      vim.api.nvim_put({
        "if err != nil {",
        "    log.Println(err)",
        "}"
      }, "l", true, true)
    end, { buffer = true, desc = "Insert error handler" })
  end,
})

-- Positions
-- Переход в начало строки (0)
set('n', 'ms', '0', { desc = 'Move to start of line' })
-- Переход на первый непробельный символ (^)
set('n', 'ml', '^', { desc = 'Move to first non-blank of line' })
-- Переход в конец строки ($)
set('n', 'mc', '$', { desc = 'Move to end of line' })
-- Strings Move
set('n', '<C-j>', ':move .+1<CR>', { noremap = true, silent = true })
set('v', '<C-j>', ":move '>+1<CR>gv=gv", { noremap = true, silent = true })
set('n', '<C-k>', ':move .-2<CR>', { noremap = true, silent = true })
set('v', '<C-k>', ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Go NVIM packages 
set('n', 'sm', ':GoModTidy<CR>', { desc = 'Run GoModTidy' })
-- go get - sd

-- SCRIPTS 
set('n', 'ss', function()
  goget()
end)
