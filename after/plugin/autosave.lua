enabled = true
-- Load the AutoSave plugin
-- require("autosave").setup()

-- Create an auto command to run 'black' on auto-save event
vim.api.nvim_exec([[
  augroup AutoSaveBlack
    autocmd!
    autocmd User AutoSaveWritePre * silent! execute '!black %'
  augroup END
]], false)

