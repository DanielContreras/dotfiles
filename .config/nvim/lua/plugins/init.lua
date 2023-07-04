return {
  --> LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {                         -- Optional
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },  -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },  -- Required
      { "hrsh7th/cmp-buffer" }, -- Autocompletion plugin
      { "hrsh7th/cmp-path" },  -- Autocompletion plugin for paths
      { "hrsh7th/cmp-nvim-lua" }, -- Autocompletion plugin for Lua
      { "hrsh7th/cmp-cmdline" }, -- Autocompletion plugin

      -- Diagnostics
      "onsails/lspkind.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },

  --> Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    cmd = "TSEnable",
    {
      "p00f/nvim-ts-rainbow",
    },
  },

  --> Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    -- or                              , branch = '0.1.x',
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      return require("plugins.configs.telescope")
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
  },

  --> Telescope fzf native
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    event = "VeryLazy",
  },

  --> nvim tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      return require("plugins.configs.nvim-tree")
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },

  --> Lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    opts = function()
      return require("plugins.configs.lualine")
    end,
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },

  --> Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    ft = { "gitcommit", "diff" },
    init = function()
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
        callback = function()
          vim.fn.system("git -C " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
            vim.schedule(function()
              require("lazy").load({ plugins = { "gitsigns.nvim" } })
            end)
          end
        end,
      })
    end,
    opts = function()
      return require("plugins.configs.gitsigns")
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },

  --> Commenter
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n",          desc = "Comment toggle current line" },
      { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n",          desc = "Comment toggle current block" },
      { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
    },
    config = function()
      require("Comment").setup()
    end,
  },

  --> indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = function()
      return require("plugins.configs.indent")
    end,
    config = function(_, opts)
      require("indent_blankline").setup(opts)
    end,
  },

  --> Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = function()
      return require("plugins.configs.autopairs").opts
    end,
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },
}
