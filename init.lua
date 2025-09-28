--
require("base")
local function require_after(module)
    local after_path = vim.fn.stdpath('config') .. '/after'
    package.path = package.path .. ';' .. after_path .. '/?.lua'
    return require(module)
end

vim.o.wrap = false         -- Disable line wrapping
vim.o.sidescrolloff = 8    -- Keep 8 columns of padding when scrolling horizontally
vim.o.sidescroll = 1       -- Scroll by 1 column when needed

-- Use the custom require function to source files from after directory

-- Plugins
 require_after('plugin.lsp')
 require_after('plugin.telescope')
 require_after('plugin.treesitter')
 require_after('plugin.autosave')
 require_after('plugin.nerdtree')
 require_after('plugin.lightline')
 require_after('plugin.icons')
 require_after('plugin.devicons')
 require_after('plugin.black')
 require_after('plugin.ale')
 require_after('plugin.cmp')
 require_after('plugin.dap')
 require_after('plugin.code-runner')
-- Themes
-- require_after('themes.github')
-- require_after('themes.catppuccin')
-- require_after('themes.everforest')
 require_after('themes.tokyodark')
