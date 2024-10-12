-- In your init.lua or a file sourced from your init.vim

-- Setup the GitHub theme

local override = require('github-theme').override
require('github-theme').setup({

  
  options = {
	styles = {
		functions = 'italic',
	},
	darken = {
		sidebars = {
			list = {"qf", "terminal", "packer"}
		},
	},
  },
  specs = {
	hint = "orange",
	error = "#ff0000",
  },


  -- override.groups({
      -- htmlTag = {fg = "#FF0000", bg = "#282c34", sp = c.hint, style = "underline"},
     -- DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
      -- this will remove the highlight groups
    --  TSField = {},

  --})
})

-- Enable the colorscheme
 vim.cmd('colorscheme github_dark')
