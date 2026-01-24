return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        progress = {
          enabled = false, -- 关闭 LSP 进度条显示, 不然打开文件的时候有时会在下面显示.
        },
      },
    },
  },
}
