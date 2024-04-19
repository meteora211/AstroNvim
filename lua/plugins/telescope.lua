return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { -- add a new dependency to telescope that is our new plugin
      "ahmedkhalf/project.nvim",
    },
    -- the first parameter is the plugin specification
    -- the second is the table of options as set up in Lazy with the `opts` key
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require("astronvim.plugins.configs.telescope")(plugin, opts)

      -- require telescope and load extensions as necessary
      require("telescope").load_extension("projects")
    end,
    opts = function(plugin, opts)
      local actions = require("telescope.actions")
      opts.pickers = {
        oldfiles = {
          -- previewer = false,
          file_ignore_patterns = {
            "*fugitiveblame",
          },
        },
      }
      opts.defaults.mappings = {
        i = {
          -- ["<C-n>"] = actions.cycle_history_next,
          -- ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,

          ["<C-u>"] = actions.results_scrolling_up,
          ["<C-d>"] = actions.results_scrolling_down,

          ["<C-c>"] = actions.close,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["<C-p>"] = actions.preview_scrolling_up,
          ["<C-n>"] = actions.preview_scrolling_down,
          -- ["<esc>"] = actions.close,
          ["<C-h>"] = actions.which_key,
        },
        n = {
          -- ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["H"] = actions.move_to_top,
          ["M"] = actions.move_to_middle,
          ["L"] = actions.move_to_bottom,
          ["q"] = actions.close,
          ["dd"] = require("telescope.actions").delete_buffer,
          ["s"] = actions.select_horizontal,
          ["v"] = actions.select_vertical,
          ["t"] = actions.select_tab,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["gg"] = actions.move_to_top,
          ["G"] = actions.move_to_bottom,

          ["<C-p>"] = actions.preview_scrolling_up,
          ["<C-n>"] = actions.preview_scrolling_down,

          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,

          ["?"] = actions.which_key,
        }
      }
    end,
  },
}
