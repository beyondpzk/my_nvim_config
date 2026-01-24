-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- 开启相对行号 (极速跳转必备)
vim.opt.relativenumber = true

-- 设置缩进 (4空格，视你的习惯而定)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- 搜索忽略大小写
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 剪贴板与 Mac 系统互通
vim.opt.clipboard = "unnamedplus"

-- 不要自动格式化. 不然按:w的时候就会自动格式化
vim.g.autoformat = false
