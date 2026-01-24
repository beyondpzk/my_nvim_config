-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- ==========================================
-- F1: 注释代码
-- ==========================================
-- 原理：让 F1 模拟按下 "gcc" (普通模式) 和 "gc" (选中模式)
-- remap = true 是关键，它表示“递归映射”，即 F1 -> gcc -> 触发注释功能
-- map("n", "<F1>", "gcc", { desc = "Toggle Comment", remap = true })
-- 加一个j会注释完当前行自动跳到下一行.
map("n", "<F1>", "gccj", { desc = "Toggle Comment", remap = true })
map("v", "<F1>", "gc", { desc = "Toggle Comment", remap = true })
-- 如果你也想在插入模式(写代码时)按 F1 注释，可以加这行：
map("i", "<F1>", "<Esc>gccgi", { desc = "Toggle Comment", remap = true })

-- 快速保存 (Space + w)
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save File" })

-- 快速退出 (Space + q)
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- 强行戒掉 Esc，使用 jk 退出插入模式 (极客标配)
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- 清除搜索高亮 (Space + nh)
map("n", "<leader>nh", ":nohl<cr>", { desc = "Clear highlights" })

-- 快速按 jk 或 jj 退出插入模式
map("i", "jk", "", { desc = "Exit Insert Mode" })
map("i", "jj", "", { desc = "Exit Insert Mode" })

-- 之前是shift + h/l 实现的代码跳转
-- 映射 Shift + 左方向键 -&gt; 切换到左边文件
-- vim.keymap.set("n", "", "BufferLineCyclePrev", { desc = "Prev Buffer" })
-- 映射 Shift + 右方向键 -&gt; 切换到右边文件
-- vim.keymap.set("n", "", "BufferLineCycleNext", { desc = "Next Buffer" })
