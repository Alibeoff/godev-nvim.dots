
local function load_scripts_from_folder(folder)
  local scan = vim.loop.fs_scandir
  local function scandir(path)
    local fd = scan(path)
    if not fd then return {} end
    local files = {}
    while true do
      local name, type = vim.loop.fs_scandir_next(fd)
      if not name then break end
      if type == "file" and name:match("%.lua$") then
        table.insert(files, name)
      end
    end
    return files
  end

  local config_path = vim.fn.stdpath("config") .. "/lua/" .. folder
  local files = scandir(config_path)

  for _, file in ipairs(files) do
    local module_name = folder .. "." .. file:gsub("%.lua$", "")
    local ok, err = pcall(require, module_name)
    if not ok then
      vim.notify("Error loading module " .. module_name .. ": " .. err, vim.log.levels.ERROR)
    end
  end
end

-- Использование:
load_scripts_from_folder("scripts")
