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

vim.opt.wildmode = "longest,list"

vim.opt.syntax = "on"

vim.opt.ttyfast = true
vim.opt.swapfile = false
vim.opt.mouse = "a"

vim.opt.spell = true
vim.opt.spelllang = "en" -- ,fr'
vim.api.nvim_set_hl(0, "SpellBad", { ctermbg = 238 })

vim.cmd([[colorscheme desert]])

-- Plugins

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		"--depth=1",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		-- Auto completion
		"neoclide/coc.nvim",
		branch = "release",
	},
	{
		-- LSP
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		-- Copilot
		"github/copilot.vim",
		--config = function()
		--	require("copilot.vim").setup({
		--		filetypes = {
		--			["."] = true,
		--		}
		--	})
		-- end,
	},
	{
		-- Ranger file explorer
		"kelly-lin/ranger.nvim",
		config = function()
			require("ranger-nvim").setup({ replace_netrw = true })
		end,
	},
	{
		-- Formatter
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		-- Auto pairs
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recommended as each new version will have breaking changes
		opts = {},
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		svelte = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		md = { "prettier" },
		less = { "prettier" },
		scss = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		toml = { "prettier" },
		java = { "google-java-format" },
	},
	format_on_save = {},
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "go", "lua", "vim", "vimdoc", "sql", "json", "javascript", "typescript", "svelte", "html", "java", "markdown" },
	highlight = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})


-- mappings
vim.keymap.set("i", "<C-Right>", "<Plug>(copilot-accept-word)")
vim.keymap.set(
	"i",
	"<CR>",
	"coc#pum#visible() ? coc#pum#next(1): '<CR>'",
	{ noremap = true, silent = true, expr = true }
)

-- commands
vim.api.nvim_create_user_command("Day", function(opts)
	vim.cmd([[colorscheme delek]])
end, { nargs = 0 })

vim.api.nvim_create_user_command("Night", function(opts)
	vim.cmd([[colorscheme desert]])
end, { nargs = 0 })

-- Abc
