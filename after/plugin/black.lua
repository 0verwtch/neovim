-- Create an augroup named "black_on_save"
local group = vim.api.nvim_create_augroup("black_on_save", { clear = true })

-- Create an autocmd to run :Black on BufWritePre for Python files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.cmd("Black")
  end,
  group = group,
})

