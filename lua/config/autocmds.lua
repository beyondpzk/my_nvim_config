-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- 这里的  表示只对当前 buffer (当前文件) 有效
    vim.cmd("iabbrev  emb from IPython import embed; embed()")
  end,
})
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.py",
  callback = function()
    local header = {
      "#!/usr/bin/env python3",
      "# -*- coding: utf-8 -*-",
      "",
      "# ==============================================================================",
      "#",
      "# Author      : Your Name",
      "# Email       : your.email@example.com",
      "# Created     : " .. os.date("%Y-%m-%d %H:%M"),
      "# Filename    : " .. vim.fn.expand("%:t"),
      "# Description : ",
      "#",
      "# ==============================================================================",
      "",
      "",
    }
    vim.api.nvim_buf_set_lines(0, 0, 0, false, header)
    vim.api.nvim_win_set_cursor(0, { 10, 16 })
  end,
})

-- 当新建 .md 文件时自动触发
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.md",
  callback = function()
    -- 1. 获取文件名（不带后缀）作为标题
    local title = vim.fn.expand("%:t:r")
    -- 2. 获取当前日期
    local date = os.date("%Y-%m-%d %H:%M")

    -- 3. 定义要插入的模板内容
    local template = {
      "---",
      "title: " .. title,
      "date: " .. date,
      "tags: []",
      "---",
      "",
      "[TOC]", -- 自动插入目录标记 (配合 markdown-preview 使用)
      "",
      "# " .. title,
      "",
    }

    -- 4. 将内容写入当前文件
    vim.api.nvim_buf_set_lines(0, 0, 0, false, template)

    -- 5. 把光标移动到最后一行，方便直接开始写
    vim.api.nvim_win_set_cursor(0, { #template, 0 })
  end,
})
