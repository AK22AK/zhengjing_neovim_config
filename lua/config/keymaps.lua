local function focus_main_window()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "" then
      vim.api.nvim_set_current_win(win)
      return
    end
  end
end

vim.keymap.set("n", ";;", function()
  focus_main_window()

  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd("cclose")
      return
    end
  end
  vim.cmd("copen")
end, { desc = "Toggle quickfix", silent = true })

vim.api.nvim_create_user_command("Rg", function(opts)
  if opts.args == "" then
    print("Rg: missing search pattern")
    return
  end

  focus_main_window()
  vim.cmd("silent grep! " .. opts.args)
  vim.cmd("cwindow")
end, { nargs = "+" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "<CR>", "<CR><Cmd>cclose<CR>", {
      buffer = true,
      silent = true,
    })
  end,
})
