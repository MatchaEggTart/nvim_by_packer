local packer = require("packer")

packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'

    -- 你的插件列表...
    -- 主题
    use 'folke/tokyonight.nvim'
    --------------------- tools ---------------------------
    -- nvim-tree
    use ({
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    })

    -- bufferline
    use ({
      'akinsho/bufferline.nvim',
      tag = "v3.*",
      requires = {
        'nvim-tree/nvim-web-devicons',
        'moll/vim-bbye' 
      }
    })

    -- lualine (新增)
    use ({
      "nvim-lualine/lualine.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons",
        opt = true
      }
    })
    use ("arkav/lualine-lsp-progress")
    -------------------------------------------------------
  end,

  config = {
    -- 并发数限制
    max_jobs = 16,

    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.org/%s",
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      default_url_format = "https://gitclone.com/github.com/%s",
      -- default_url_format = "https://github.com.cnpmjs.org/%s",
    },

    -- 以浮动窗口打开安装列表
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },

  -- 每次保存 plugins.lua 自动安装插件
  pcall(
    vim.cmd,
    [[
      augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
      augroup end
    ]]
  )
})
