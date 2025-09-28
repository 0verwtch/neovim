--local lspconfig = require('lspconfig')
--lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
--  settings = {
--    ['rust-analyzer'] = {},
--  },
-- }

-- lspconfig.pyright.setup {}

require("mason").setup()
require("mason-lspconfig").setup({
 	ensure_installed = {"pyright", "rust_analyzer", "eslint", "phpactor"}
})

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Example LSP servers setup
lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
}

lspconfig.pyright.setup {
    capabilities = capabilities,
}

lspconfig["eslint"].setup {
  -- capabilities = capabilities
  cmd = { "eslint", "--stdio" },
  root_dir = lspconfig.util.root_pattern(
    '.eslintrc',
   '.eslintrc.js',
   '.eslintrc.cjs',
   '.eslintrc.yaml',
   'eslint.config.mjs',
   '.eslintrc.yml',
   '.eslintrc.json' )
}	

-- init.lua

-- Set leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Function to set up key mappings after LSP attaches to buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Define key mappings
    local opts = { noremap=true, silent=true }
    local keymap = vim.api.nvim_buf_set_keymap

    -- LSP Key Mappings
    keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)         -- Go to Definition
    keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)        -- Go to Declaration
    keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)         -- Find References
    keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)     -- Go to Implementation
    keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)               -- Hover Documentation
    keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)    -- Rename
    keymap(bufnr, 'n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- Code Action
    keymap(bufnr, 'n', '<leader>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)   -- Format Document

    -- Optional: Diagnostics key mappings
    keymap(bufnr, 'n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    keymap(bufnr, 'n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    keymap(bufnr, 'n', '<leader>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
    keymap(bufnr, 'n', '<leader>q', '<Cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end
-- Example configuration for the LSP servers
local servers = { "eslint","rust_analyzer", "pyright" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
    }
end
