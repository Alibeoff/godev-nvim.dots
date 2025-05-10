function sayhe()
  vim.cmd('normal yi"')
  local clipboard_content = vim.fn.getreg('+') 
  local output = vim.fn.system('go get ' .. clipboard_content)
  print(output)
end
