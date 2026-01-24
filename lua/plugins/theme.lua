return {
  -- 1. 下载主题插件
  { "ellisonleao/gruvbox.nvim", name = "gruvbox", priority = 1000 },

  -- 安装 Catppuccin 主题
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- 安装 Kanagawa 主题 (强烈推荐)
  { "rebelot/kanagawa.nvim", priority = 1000 },

  -- 安装 tokyonight 主题
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- 这里改风格: "storm", "moon", "night", "day"
      transparent = true, -- 开启透明背景 (很酷！)
      styles = {
        sidebars = "transparent", -- 侧边栏也透明
        floats = "transparent", -- 悬浮窗也透明
      },
    },
  },


  -- 2. 配置 LazyVim 使用该主题
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "tokyonight",
      -- colorscheme = "catppuccin",
      -- colorscheme = "kanagawa",
    },
  },
}
