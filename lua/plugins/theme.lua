return {
  -- 1. 下载主题插件
  { "ellisonleao/gruvbox.nvim", name = "gruvbox", priority = 1000 },

  -- 安装 Catppuccin 主题
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- 安装 Kanagawa 主题 (强烈推荐)
  { "rebelot/kanagawa.nvim", priority = 1000 },


  -- 2. 配置 LazyVim 使用该主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      -- colorscheme = "catppuccin",
      -- colorscheme = "kanagawa",
    },
  },
}
