vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"

vim.opt.updatetime = 50
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "preservim/nerdtree",
    config = function()
      vim.keymap.set("n", "<leader>n", ":NERDTreeToggle<CR>", { desc = "Toggle NERDTree" })
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 0 then
            vim.cmd("NERDTree")
            return
          end

          local first_arg = vim.fn.argv(0)
          if first_arg ~= "" and vim.fn.isdirectory(first_arg) == 1 then
            vim.cmd("NERDTree")
            vim.cmd("wincmd p")
          end
        end,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },
{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ok, treesitter = pcall(require, "nvim-treesitter")
      if not ok then
        return
      end

      treesitter.setup({})
      treesitter.install({
          "lua",
          "vim",
          "vimdoc",
          "python",
          "javascript",
          "typescript",
          "go",
          "rust",
          "markdown",
          "markdown_inline",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown" },
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
})

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear highlight" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
