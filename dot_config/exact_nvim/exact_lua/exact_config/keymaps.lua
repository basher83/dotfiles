-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Example: normal keymaps
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>tt", ":terminal<CR>", { desc = "Terminal in split" })

-- Now the which-key block:
local wk = require("which-key")

---@diagnostic disable: missing-fields
wk.register({
  d = {
    name = "Dotfiles",
    a = { "<cmd>e ~/.zsh/aliases.zsh<CR>", "Aliases" },
    f = { "<cmd>e ~/.zsh/functions.zsh<CR>", "Functions" },
    s = { "<cmd>e ~/.config/starship.toml<CR>", "Starship" },
    n = { "<cmd>e ~/.config/nvim/init.lua<CR>", "Neovim Config" },
  },
}, {
  prefix = "<leader>",
  mode = "n",
})
---@diagnostic enable: missing-fields
