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
        builtin = {
          ["<F1>"] = "toggle-help",
          ["<C-j>"] = "down",
          ["<C-k>"] = "up",
          ["<C-n>"] = "preview-page-down",
          ["<C-p>"] = "preview-page-up",
          -- ["<C-d>"] = "page-down",
          -- ["<C-u>"] = "page-up",
        },
        fzf = {
          -- fzf style keybinding, use man fzf to check more bindings
          ["ctrl-j"] = "down",
          ["ctrl-k"] = "up",
          ["ctrl-d"] = "page-down",
          ["ctrl-u"] = "page-up",
          -- ["ctrl-n"] = "preview-down",
          -- ["ctrl-p"] = "preview-up",
          -- ["ctrl-l"] = "preview-page-down",
          -- ["ctrl-h"] = "preview-page-up",
        },
      },
    })
  end
}
