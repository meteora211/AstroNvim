local tnoremap = function(lhs, rhs)
  vim.api.nvim_buf_set_keymap(0, "t", lhs, rhs, { silent = true, noremap = true })
end

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      winopts = {
        window_on_create = function()
          tnoremap("<c-j>", "<down>")
          tnoremap("<c-k>", "<up>")
        end
      },
      keymap = {
        fzf = {
          -- Copy the default binds and add these below
          ["ctrl-j"] = "down",
          ["ctrl-k"] = "up",
        },
      },
    })
  end
}
