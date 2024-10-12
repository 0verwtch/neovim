-- Automatically open NerdTree when Neovim starts if no files are specified
vim.cmd([[
  autocmd VimEnter * if !argc() | NERDTree | endif
]])

-- Keep NerdTree open after opening a file
vim.g.NERDTreeQuitOnOpen = 0

-- Automatically open NerdTree when opening a directory
vim.cmd([[
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | enew | endif
]])

-- Close Neovim if NerdTree is the only window remaining
vim.cmd([[
  autocmd bufenter * if (winnr('$') == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
]])
vim.api.nvim_set_keymap('n', 'nt', ':NERDTreeFocus<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'tb', ':tabnew<CR> nt', { noremap = true, silent = true })

