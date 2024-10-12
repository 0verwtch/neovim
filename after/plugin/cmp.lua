
local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
    },
    sources = {
        { name = 'nvim_lsp' },   -- For LSP
        { name = 'luasnip' },    -- For LuaSnip
        { name = 'buffer' },     -- For buffer words
        { name = 'path' },       -- For file system paths
    }
})

