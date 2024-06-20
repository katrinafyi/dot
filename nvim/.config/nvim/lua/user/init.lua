return {
  polish = function()
    vim.cmd('highlight VertSplit guifg=Grey')
    vim.cmd('highlight LspCodeLens guifg=#626a73')
    vim.cmd('highlight! link LspInlayHint LspCodeLens')

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = {"tex", "*.tex", "*.txt", "*.md"},
      callback = function(ev)
        vim.opt_local.wrap = true
      end
    })

    vim.keymap.set('n', 'S', function ()
      require('leap').leap { target_windows = { vim.api.nvim_get_current_win() } }
    end)
  end,
  colorscheme = "ayu",

  lsp = {
    formatting = {
      format_on_save = false,
    },
    servers = {
      "clangd",
    },
    config = {
      html = {
        settings = {
          autoClosingTags = true,
          format = {
            templating = true,
          },
          hover = {
            documentation = true,
            references = true,
          },
        }
      }
    }
  },
}
