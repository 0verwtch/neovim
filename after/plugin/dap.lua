local dap = require('dap')
local dapui = require('dapui')
dap.adapters.python = {
    type = 'executable';
    command = 'python';
    args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";  -- Launch the currently open file
        pythonPath = function()
            -- Use the .venv in the current project directory if it exists
            local cwd = vim.fn.getcwd()  -- Get the current working directory
            if vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            elseif vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'  -- Alternate virtualenv name (if not `.venv`)
            else
                return '/usr/bin/python'  -- Fallback to system Python
            end
        end;
    },
}

-- Toggle breakpoint
vim.api.nvim_set_keymap('n', '<F9>', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true })
-- Start/continue debugging
vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
-- Step over
vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
-- Step into
vim.api.nvim_set_keymap('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
-- Step out
vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })
-- Terminate
vim.api.nvim_set_keymap('n', '<F7>', '<cmd>lua require"dap".terminate()<CR>', { noremap = true, silent = true })
-- UI
vim.api.nvim_set_keymap('n', '<F8>', '<cmd>lua require"dapui".toggle()<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        local venv = vim.fn.getcwd() .. '/.venv/bin/activate'
        if vim.fn.filereadable(venv) == 1 then
            vim.cmd('call termopen("source ' .. venv .. '")')
        end
    end,
})

