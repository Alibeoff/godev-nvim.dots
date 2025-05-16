## Mappings
    - sm --- gomod tidy
    - C-j --- move strings down
    - C-k --- move strings up [n, v] mode for both
    - mc --- goto endline
    - ml --- goto first simbol in line 
    - ms --- goto start line
    - ee ---  snippet to add error handler [N] mode 
    - Tab --- next buffer [N] mode
    - S-Tab --- Prev buffer [N] mode
    - leader+c --- close buffer
    - gt --- go add tag [N] mode
    - gm --- go remove tag [N] mode
    - Tab ---  add tab space in startline [V] mode
    - S-Tab ---  remove tab space in startline [V] mode
    - leader+w --- save file
    - leader+q --- close neovim
    - jj --- switch [I] to [N] mode
    - leader+/ --- commenting line [N, V] mode
    - leader+ff --- telescope find file
    - leader+fw --- telescope find word
    - leader+fb --- telescope find buffer
    - se --- window for see full error body
    - sge --- telescope window for all errors in project
# Snacks: 
    - gr --- References
    - gI --- Goto Implementations
    - gd --- Goto Defenitions
    - ;; --- Open Terminal (float)
    - leader+lg --- lazygit
    - leader+cr --- rename_file
# Nvim tree:
    - leader+e --- open tree / close tree
    - leader+o --- focus to window
    - leader+h --- show/hide dotfiles
    - hh --- close dir in focus files
    - h --- close dir
    - l --- open file or dir
# LSP
    - sa --- imports window for golang
# Any Mappings
    - gy --- global copy content for ssh connection
    - ll --- to [I] mode -> tips 
    - sd --- telescope window to search and install go package
    - ss --- auto install go package in focus
    - ;s --- telescope to run your go files
    - rs --- rename wort to all project

## Symbols Outline Group
    goto_location = {"<CR>", "ll"},
    close = {"<Esc>", "q"},
    open / hide = {"sl"},
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",

