local aux_packer = require("utils.aux.packer")

local plugins = {}

plugins.basic = {
    { "wbthomason/packer.nvim" },
    { "lewis6991/impatient.nvim" },
    { "rcarriga/nvim-notify" },
    { "tpope/vim-repeat", fn = "repate#set" },
    { "nvim-lua/plenary.nvim", module = "plenary" },
    { "williamboman/mason.nvim", after = { "nvim-notify" } },
    { "nvim-treesitter/nvim-treesitter", run = { ":TSUpdate" } },
    { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
}

plugins.theme = {
    { "askfiy/starlight" },
    { "catppuccin/nvim", as = "catppuccin" },
    { "ajmwagar/vim-deus" },
    { "EdenEast/nightfox.nvim", run = ":NightfoxCompile" },
}

plugins.lsp = {
    { "williamboman/mason-lspconfig.nvim", after = { "mason.nvim" } },
    { "SmiteshP/nvim-navic", after = { "mason-lspconfig.nvim" } },
    { "stevearc/aerial.nvim", after = { "nvim-navic" } },
    { "neovim/nvim-lspconfig", after = { "aerial.nvim" } },
    { "j-hui/fidget.nvim", after = { "nvim-lspconfig" } },
    { "kosayoda/nvim-lightbulb", after = { "nvim-lspconfig" } },
    { "jose-elias-alvarez/null-ls.nvim", after = { "nvim-lspconfig" } },
}

plugins.complete = {
    { "rafamadriz/friendly-snippets", event = { "InsertEnter", "CmdlineEnter" } },
    { "hrsh7th/vim-vsnip", after = { "friendly-snippets" } },
    { "hrsh7th/nvim-cmp", after = { "vim-vsnip" } },
    { "hrsh7th/cmp-vsnip", after = { "nvim-cmp" } },
    { "hrsh7th/cmp-nvim-lsp", after = { "nvim-cmp" } },
    { "hrsh7th/cmp-buffer", after = { "nvim-cmp" } },
    { "hrsh7th/cmp-path", after = { "nvim-cmp" } },
    { "hrsh7th/cmp-cmdline", after = { "nvim-cmp" } },
    { "kristijanhusak/vim-dadbod-completion", after = { "nvim-cmp" } },
    { "tzachar/cmp-tabnine", run = "./install.sh", after = { "nvim-cmp" } },
    { "github/copilot.vim", ft = { "dap-repl" }, event = { "InsertEnter" }, disable = true },
}

plugins.dap = {
    { "mfussenegger/nvim-dap", module = "dap" },
    { "theHamsta/nvim-dap-virtual-text", after = { "nvim-dap" } },
    { "rcarriga/nvim-dap-ui", after = { "nvim-dap" } },
}

plugins.editor = {
    { "AndrewRadev/switch.vim" },
    { "windwp/nvim-autopairs", event = { "InsertEnter" } },
    { "ur4ltz/surround.nvim", event = { "BufRead", "BufNewFile" } },
    { "RRethy/vim-illuminate", event = { "BufRead", "BufNewFile" } },
    { "lukas-reineke/indent-blankline.nvim", after = { "nvim-treesitter" } },
    { "p00f/nvim-ts-rainbow", after = { "nvim-treesitter" } },
    { "windwp/nvim-ts-autotag", after = { "nvim-treesitter" } },
    { "JoosepAlviste/nvim-ts-context-commentstring", after = { "nvim-treesitter" } },
    {
        "numToStr/Comment.nvim",
        keys = { "gb", "gc" },
        module = { "Comment" },
        after = { "nvim-ts-context-commentstring" },
    },
    {
        "mg979/vim-visual-multi",
        fn = { "vm#commands#add_cursor_up", "vm#commands#add_cursor_down" },
        keys = { "<c-n>" },
    },
}

plugins.lanaguage = {
    { "christianchiarulli/lua-dev.nvim" },
    { "davidgranstrom/nvim-markdown-preview", ft = { "markdown" }, cmd = { "MarkdownPreview" } },
    { "Vimjas/vim-python-pep8-indent", ft = "py", event = { "InsertEnter" } },
    -- { "AckslD/swenv.nvim" },
}

plugins.find = {
    { "tami5/sqlite.lua" },
    { "AckslD/nvim-neoclip.lua", after = { "sqlite.lua" } },
    { "kevinhwang91/nvim-hlslens" },
    { "phaazon/hop.nvim", cmd = { "HopWord", "HopLine", "HopChar1", "HopChar1CurrentLine" } },
    { "folke/todo-comments.nvim", event = { "BufRead", "BufNewFile" } },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make", module = { "telescope._extensions.fzf" } },
}

plugins.tools = {
    { "uga-rosa/translate.nvim" },
    { "olimorris/persisted.nvim" },
    { "norcalli/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" } },
    { "kristijanhusak/vim-carbon-now-sh", cmd = { "CarbonNowSh" } },
    { "lewis6991/gitsigns.nvim", event = { "BufRead", "BufNewFile" } },
    { "lewis6991/spellsitter.nvim", after = { "nvim-treesitter" } },
    { "dstein64/vim-startuptime", cmd = { "StartupTime" } },
    { "folke/which-key.nvim", event = { "BufRead", "BufNewFile" } },
    { "michaelb/sniprun", run = "bash ./install.sh", event = { "BufRead" } },
}

plugins.views = {
    { "nvim-lualine/lualine.nvim", after = { "nvim-web-devicons" } },
    { "nvim-pack/nvim-spectre", module = "spectre" },
    { "mbbill/undotree", event = { "BufRead", "BufNewFile" } },
    { "kyazdani42/nvim-tree.lua", cmd = { "NvimTreeToggle", "NvimTreeFindFile" } },
    { "akinsho/bufferline.nvim", events = { "BufNewFile", "BufRead", "TabEnter" } },
    { "tpope/vim-dadbod", fn = { "db#resolve" } },
    { "kristijanhusak/vim-dadbod-ui", cmd = { "DBUIToggle" } },
    { "dstein64/nvim-scrollview", event = { "BufRead", "BufNewFile" } },
    { "akinsho/toggleterm.nvim", module = "toggleterm" },
}

aux_packer.entry(plugins)

return plugins
