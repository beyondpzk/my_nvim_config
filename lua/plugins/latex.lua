return {
  {
    "lervag/vimtex",
    -- LazyVim 默认是懒加载的，这里我们不需要改 lazy 设置，直接配置 opts 或 init
    init = function()
      -- 指定使用 Skim 作为阅读器
      vim.g.vimtex_view_method = "skim"

      -- 这里的设置是为了防止 Skim 窗口每次编译都抢焦点
      vim.g.vimtex_view_skim_sync = 1
      vim.g.vimtex_view_skim_activate = 1
    end,
  },

  -- 添加我的片段.
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
}
