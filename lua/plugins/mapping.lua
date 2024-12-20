return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(function(bufnr)
                require("astrocore.buffer").close(bufnr)
              end)
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { name = "Buffers" },

          -- toggle term
          ["<C-\\>"] = { '<Cmd>execute v:count . "ToggleTerm size=10 direction=horizontal"<CR>', desc = "Toggle terminal" },

          -- findings
          ["<Leader>fa"] = false,
          ["<Leader>fm"] = false,
          ["<Leader>fo"] = false,
          ["<Leader>fp"] = { "<cmd>Telescope projects<cr>", desc = "projects"},

          -- telescope findings
          ["<Leader>fr"] = { function() require('telescope.builtin').oldfiles() end, desc = "Recent files"},
          ["<Leader>fc"] = { function() require("telescope.builtin").colorscheme { enable_preview = true } end, desc = "Find themes"},

          -- fzf findings
          -- ["<Leader>ff"] = { function() require('fzf-lua').files() end, desc = "Find files"},
          -- ["<Leader>fg"] = { function() require('fzf-lua').grep{search=vim.fn.expand('<cword>')} end, desc = "Grep string"},
          -- ["<Leader>ft"] = { function() require('fzf-lua').live_grep() end, desc = "Find text"},
          ["<Leader>ff"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
          ["<Leader>fg"] = { function() require('telescope.builtin').grep_string{search=vim.fn.expand('<cword>')} end, desc = "Grep string"},
          ["<Leader>ft"] = { function() require('telescope.builtin').live_grep() end, desc = "Find text"},

          -- jumps
          ["<Leader> "] = { name = "Jumps" },
          ["<Leader> k"] = { "<cmd>HopLineBC<cr>", desc = "up" },
          ["<Leader> j"] = { "<cmd>HopLineAC<cr>", desc = "down" },
          ["<Leader> l"] = { "<cmd>HopWordCurrentLineAC<cr>", desc = "forward" },
          ["<Leader> h"] = { "<cmd>HopWordCurrentLineBC<cr>", desc = "backward" },
          ["<Leader> p"] = { "<cmd>HopPattern<cr>", desc = "pattern" },
          ["<Leader>  "] = { "<cmd>HopLine<cr>", desc = "up-down" },
          ["<Leader> 1"] = { "<cmd>HopChar1<cr>", desc = "char1" },
          ["<Leader> 2"] = { "<cmd>HopChar2<cr>", desc = "char2" },

          -- nvimtree
          ["<Leader>e"] = { "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
          ["<Leader>q"] = {
            function ()
	            local nvimTree=require("nvim-tree.api")
	            local currentBuf = vim.api.nvim_get_current_buf()
	            local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
	            if currentBufFt == "NvimTree" then
	              vim.cmd.wincmd "p"
	            else
		            nvimTree.tree.focus()
	            end
            end,
            desc = "Toggle Explorer Focus",
          },

          -- disable keymappings
          ["<Leader>/"] = false,
          ["<Leader>C"] = false,
          ["<Leader>c"] = false,
          ["<Leader>q"] = false,
          ["<Leader>Q"] = false,
          ["<Leader>S"] = false,
          ["<Leader>Sl"] = false,
          ["<Leader>Ss"] = false,
          ["<Leader>SS"] = false,
          ["<Leader>St"] = false,
          ["<Leader>Sd"] = false,
          ["<Leader>SD"] = false,
          ["<Leader>Sf"] = false,
          ["<Leader>SF"] = false,
          ["<Leader>S."] = false,
          ["<Leader>w."] = false,

          -- outline
          ["<Leader>o"] = { "<cmd>AerialToggle<CR>", desc = "Outline" },

          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
          -- windows
          -- ["<Leader>w"] = { name = "Windows" },
          -- little finger lives matter!
          ["<Leader>w,"] = { "<cmd>vertical resize -999<cr>", desc = "minimize vertical window" },
          ["<Leader>w."] = { "<cmd>vertical resize +999<cr>", desc = "maximize vertical window" },
          ["<Leader>w="] = { "<C-w>=", desc = "equal windows" },
          ["<Leader>w|"] = { "<C-w>|", desc = "max vertical window" }, -- same with <Leader>w.
          ["<Leader>wh"] = { "<cmd>hide<cr>", desc = "hide current window" },
          -- TODO: use hide
          ["<Leader>wo"] = { "<cmd>only<cr>", desc = "make current window only window" },
          ["<Leader>wt"] = { "<cmd>WindowsToggleAutowidth<cr>", desc = "toggle windows auto size" },

          -- fugitive mapping
          ["<Leader>gb"] = {"<cmd>Git blame<cr>", desc = "fugitive blame"},

          -- undotree
          ["<Leader>uu"] = {"<cmd>Telescope undo<cr>", desc = "Undo"},

          -- search setting
          ["n"] = { "nzz", desc = "next" },
          ["N"] = { "Nzz", desc = "next" },
          ["*"] = { "*zz", desc = "next" },
          ["#"] = { "#zz", desc = "next" },
          ["g*"] = { "g*zz", desc = "next" },
          ["g#"] = { "g#zz", desc = "next" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
          ["<C-\\>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle terminal" }
        },
        v = {
          [">"] = { ">gv", desc = "Keep indent"},
          ["<"] = { "<gv", desc = "Keep indent"},

        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function()
              vim.lsp.buf.hover()
            end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function()
              vim.lsp.buf.declaration()
            end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
          -- lsp
          ["<Leader>li"] = {"<cmd>LspInfo<cr>", desc = "LspInfo"},
        },
      },
    },
  },
}
