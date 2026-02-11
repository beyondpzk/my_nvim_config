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
    -- 1. 优化：仅获取纯文件名（带后缀，不含路径），避免路径干扰匹配
    local full_filename = vim.fn.expand("%:t")  -- %:t 表示获取“文件名+后缀”，忽略路径
    print("full_filename: ", full_filename)

    -- 2. 提取 date 和 filename，保持原有匹配逻辑
    -- local date, filename = string.match(full_filename, "^(%d%d%d%d-%d%d-%d%d)-([^%.]+)%.md$")
    local date, filename = full_filename:match("^(%d+-%d+-%d+)-(.*)%.md$")
    print("date: ", date)
    print("filename: ", filename)
    vim.notify("date：" .. tostring(date) .. " | filename：" .. tostring(filename), vim.log.levels.INFO)


    -- 3. 优化：添加判空，避免非固定格式文件出现 nil 显示异常
    if not date or not filename then
      -- 可选：如果格式不符，可插入简化模板，或直接返回不插入内容
      local simple_template = {
        "---",
        "layout: post",
        "title: 未命名文档",
        "date: " .. os.date("%Y-%m-%d"),
        "categories: []",
        "tags: []",
        "---",
        "",
        "[TOC]",
        "",
        "# 未命名文档",
        ""
      }
      vim.api.nvim_buf_set_lines(0, 0, 0, false, simple_template)
      vim.api.nvim_win_set_cursor(0, { #simple_template + 1, 0 })
      return
    end

    -- 4. 定义要插入的模板内容（保持原有风格，无改动）
    local template = {
      "---",
      "layout: post",
      "title: " .. filename,
      "date: " .. date,
      "categories: []",
      -- "tags: []",
      "toc:",
      "    sidebar: left",
      "    max_level: 4",
      "---",
      "",
      "[TOC]", -- 自动插入目录标记 (配合 markdown-preview 使用)
      "",
      "# " .. filename,
      "",
    }

    -- 5. 将内容写入当前文件
    vim.api.nvim_buf_set_lines(0, 0, 0, false, template)

    -- 6. 优化：光标定位到模板最后一行的下一行，更方便开始书写正文
    vim.api.nvim_win_set_cursor(0, { #template + 1, 0 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- 这里的  表示只对当前 buffer (当前文件) 有效
    vim.cmd("iabbrev  pal [paper link]()")
  end,
})
