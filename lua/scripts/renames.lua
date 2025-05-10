
function lsp_rename_and_save()
  local curr_name = vim.fn.expand("<cword>")
  local params = vim.lsp.util.make_position_params()

  vim.ui.input({ prompt = "Rename to: ", default = curr_name }, function(new_name)
    if not new_name or #new_name == 0 or new_name == curr_name then
      return
    end
    params.newName = new_name
    vim.lsp.buf_request(0, "textDocument/rename", params, function(_, result, ctx)
      if not result then return end
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      vim.lsp.util.apply_workspace_edit(result, client.offset_encoding)

      -- Сохраняем все изменённые буферы
      vim.cmd("wa")

      local changed_files = vim.tbl_count(result.changes or {})
      print(string.format("Renamed in %d file(s), all buffers saved.", changed_files))
    end)
  end)
end

-- Привязка к горячей клавише, например <leader>rn
vim.keymap.set("n", "sr", lsp_rename_and_save, { desc = "LSP Rename and save all" })

