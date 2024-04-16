-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      local get_icon = require("astroui").get_icon
      local dashboard = require("alpha.themes.dashboard")
      opts.section.buttons.val = {
        dashboard.button("n", get_icon("FileNew", 2, true) .. "New File  ", "<CMD>ene!<CR>"),
        dashboard.button("f", get_icon("Search", 2, true) .. "Find File  ", "<CMD>Telescope find_files<CR>"),
        dashboard.button("r", get_icon("DefaultFile", 2, true) .. "Recents  ", "<CMD>Telescope oldfiles <CR>"),
        dashboard.button("t", get_icon("WordFile", 2, true) .. "Find Text  ", "<CMD>Telescope live_grep<CR>"),
        -- dashboard.button("s", get_icon("Refresh", 2, true) .. "Last Session  ", "<Leader>Sl"),
        dashboard.button("c", get_icon("Package", 2, true) .. "Configuration  ", "<CMD>Lazy<CR>"),
        dashboard.button("q", get_icon("BufferClose", 2, true) .. "Quit  ", "<CMD>quit<CR>"),
      }
      return opts
    end,
  },

  -- disable better-escape
  { "max397574/better-escape.nvim", enabled = false },
  -- disable neo-tree
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

}
