return {
  -- 1. 告诉 Mason：别再自动装 pyright 了！
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- 从自动安装列表中剔除 pyright
      opts.ensure_installed = vim.tbl_filter(function(name)
        return name ~= "pyright"
      end, opts.ensure_installed)
    end,
  },

  -- 2. 告诉 LSP：就算装了 pyright，也别启动它！
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = false,
      },
    },
  },
}
