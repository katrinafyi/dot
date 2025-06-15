
-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

-- return {
  -- polish = function()
    vim.cmd('highlight VertSplit guifg=Grey')
    vim.cmd('highlight WinSeparator guifg=Grey')
    vim.cmd('highlight LspCodeLens guifg=#626a73')
    vim.cmd('highlight! link LspInlayHint LspCodeLens')

    vim.cmd(':set tags=./tags,tags,.git/tags')
    vim.cmd('nnoremap ]t :tnext<CR><CR>')
    vim.cmd('nnoremap [t :tprevious<CR><CR>')
    vim.cmd('nnoremap gf <C-]>')
    function search_tags()
      require("telescope.builtin").tags({ only_sort_tags = true, show_line = true, path_display = {"filename_first"}, show_kind=true, layout_strategy = "center", layout_config = {preview_cutoff = 5, anchor = 'N', height = 0.5} })
    end
    vim.keymap.set("n", "<Leader>lf", function()
      search_tags()
    end, opts)
    vim.keymap.set("n", "<Leader>lF", function()
      local word = vim.api.nvim_eval('expand("<cword>")')

      search_tags()

      vim.api.nvim_input(word .. "<Esc>")
    end, opts)


    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = {"tex", "*.tex", "*.txt", "*.md"},
      callback = function(ev)
        vim.opt_local.wrap = true
      end
    })

    vim.keymap.set('n', 'S', function ()
      require('leap').leap { target_windows = { vim.api.nvim_get_current_win() } }
    end)
  -- end,


--   colorscheme = "ayu",
--
--   lsp = {
--     formatting = {
--       format_on_save = false,
--     },
--     servers = {
--       "clangd",
--     },
--     config = {
--       html = {
--         settings = {
--           autoClosingTags = true,
--           format = {
--             templating = true,
--           },
--           hover = {
--             documentation = true,
--             references = true,
--           },
--         }
--       }
--     }
--   },
-- }
