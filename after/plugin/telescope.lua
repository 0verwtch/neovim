local builtin = require('telescope.builtin')

vim.keymap.set('n', 'tl', builtin.find_files, {})
vim.keymap.set('n', 'tg', function()
	builtin.grep_string({search = vim.fn.input("Grep > ")});
end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
