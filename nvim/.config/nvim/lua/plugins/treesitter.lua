-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  -- commit = "ecdae44baefeffceade8b0c752d80ececad28e76",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- "basilir"
      -- add more arguments for adding more treesitter parsers
    },
  },
  config = function(_, opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.basilir = {
      install_info = {
        url = "~/progs/obasil/tree-sitter",
        -- url = "https://github.com/agle/bincaml",
        -- revision = "main", -- change this if you want
        -- location = "tree-sitter", -- tree-sitter subfolder inside repo
        files = {"src/parser.c"},
        generate_requires_npm = false,
        requires_generate_from_grammar = true,
      },
      filetype = "basilir",
    }

    require("nvim-treesitter.configs").setup(opts)
  end,
}

-- vim.filetype.add({ extension = { il = 'basilir' } })
-- vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
-- callback = function()
--   require('nvim-treesitter.parsers').basilir = {
--     install_info = {
--       path = '~/progs/obasil/tree-sitter',
--       -- optional entries:
--       files = { "src/parser.c" },
--       generate = true, -- only needed if repo does not contain pre-generated `src/parser.c`
--       generate_from_json = true, -- only needed if repo does not contain `src/grammar.json` either
--       queries = 'queries', -- also install queries from given directory
--     },
--   }
-- end})
-- vim.treesitter.language.register('basilir', {'basilir'})
