-- ~/.config/nvim/lua/plugins/cmp.lua
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    -- Disable completion in Spectre panel
    opts.enabled = function()
      local buftype = vim.bo.buftype
      local filetype = vim.bo.filetype
      if filetype == "spectre_panel" then
        return false
      end
      return buftype ~= "prompt"
    end
  end,
}
