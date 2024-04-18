-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- themes
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  -- languages
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.cpp" },
  -- completion
  -- { import = "astrocommunity.completion.codeium-vim" },
  -- { import = "astrocommunity.completion.tabnine-nvim" },
  -- import/override with your plugins folder
}
