return {
  -- 1. 让 Neovim 内部变漂亮的插件
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        sign = false,
        width = "block",
        right_pad = 1,

      },
      heading = {
        sign = false,
        icons = { "h1 ", "h2 ", "h3 ", "h4 ", "h5 ", "h6 " },
      },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
    end,
  },


  -- 2. 浏览器实时预览插件 (类似 Skim)
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      -- 设置主题为 light (亮色) 或 dark (深色)
      vim.g.mkdp_theme = "light"
      -- 【核心】指定一个自定义 CSS 文件的路径
      -- 你可以去网上找 "github-markdown-css" 或者 "typora-css"
      -- vim.g.mkdp_markdown_css = '/Users/你的用户名/.config/nvim/markdown.css'
      -- 加载自定义 CSS
      vim.g.mkdp_markdown_css = vim.fn.expand("~/.config/nvim/sidebar.css")
      -- vim.g.mkdp_refresh_slow = 0 -- 0 = 实时更新，1 = 保存/退出模式时才更新
            -- -- 0也不能够做到实时更新
      vim.g.mkdp_refresh_slow = 1 -- 0 = 实时更新，1 = 保存/退出模式时才更新
    end,
    ft = { "markdown" },
    -- keys = {
    --   {
    --     "cp",
    --     "MarkdownPreviewToggle",
    --     desc = "Markdown Preview",
    --   },
    -- },
    -- 在这里定义快捷键
    keys = {
      -- 方式 1: 使用  m (即 空格 + m)
      { "m", ":MarkdownPreview", desc = "Markdown Preview" },
    },
  },
}
