-- Install ale
-- use 'dense-analysis/ale'

-- Enable ALE Fixing on Save
vim.g.ale_fix_on_save = 1
vim.g.ale_javascript_eslint_executable = 'eslint'
vim.g.ale_javascript_eslint_options = '--fix'
-- Specify ALE Fixers for Python
vim.g.ale_fixers = {
    python = {'black'},
    javascript = {'eslint'}
}

