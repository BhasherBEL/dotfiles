-- General options
vim.opt.compatible = false
vim.opt.ignorecase = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wildmode = 'longest,list'

vim.opt.syntax = 'on'

vim.opt.ttyfast = true
vim.opt.swapfile = false
vim.opt.mouse = 'a'

vim.opt.spell = true
vim.opt.spelllang = 'en' -- ,fr'
vim.api.nvim_set_hl(0, "SpellBad", { ctermbg=238 })

-- Plugins
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('neoclide/coc.nvim', {['branch'] = 'release'})
Plug('francoiscabrol/ranger.vim')
Plug('rbgrouleff/bclose.vim')
-- Plug('zbirenbaum/copilot.lua')
Plug('github/copilot.vim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

vim.call('plug#end')

-- inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
--                            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

vim.g.ranger_replace_netrw = 1
vim.keymap.set('i', '<C-Right>', '<Plug>(copilot-accept-word)')

require('nvim-treesitter.configs').setup({
	ensure_installed = { "go", "lua", "vim", "vimdoc", "sql", "json", },
  highlight = {
    enable = true,
  },
})

