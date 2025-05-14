-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs = 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.wrap = false

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

-- Force latex
vim.g.tex_flavor = "latex"

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99

-- netrw
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

-- Autocommands
-- Latex
vim.api.nvim_create_autocmd( {"BufEnter", "BufWinEnter"}, {
    pattern = {"*.tex"},
    command = [[ set wrap linebreak breakindent spell ]]
})
