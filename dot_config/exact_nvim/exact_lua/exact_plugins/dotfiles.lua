-- ~/.config/nvim/lua/plugins/dotfiles.lua
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>fd",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "Dotfiles",
          cwd = "~/.dotfiles", -- Or use "~/.config" or your dotfile repo root
          hidden = true,
        })
      end,
      desc = "Find Dotfile",
    },
  },
}
