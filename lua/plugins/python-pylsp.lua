return {
  -- 1. 配置 LSP (Pylsp)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                -- 关掉 Pylsp 自带的格式化，交给 conform 做，避免冲突
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                black = { enabled = false },

                -- 开启其他好用的检查
                pycodestyle = { enabled = true, maxLineLength = 120 },
                pyflakes = { enabled = true },
                mccabe = { enabled = false }, -- 关掉复杂度检查，太吵了
              },
            },
          },
        },
      },
    },
  },

  -- 2. 格式化配置 + 强制绑定 F8
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "isort", "autopep8" },
      },
    },
    -- 重点：在这里直接定义快捷键
    keys = {
      {
        "<F8>",
        function()
          require("conform").format({ lsp_fallback = true })
        end,
        mode = { "n", "v" }, -- 支持普通模式和选中模式
        desc = "Format with Conform",
      },
    },
  },
}
