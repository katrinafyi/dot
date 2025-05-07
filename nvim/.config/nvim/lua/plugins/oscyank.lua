return {
  'ojroques/vim-oscyank',
  init = function ()
    vim.cmd([[
      if (!has('nvim') && !has('clipboard_working'))
          " In the event that the clipboard isn't working, it's quite likely that
          " the + and * registers will not be distinct from the unnamed register. In
          " this case, a:event.regname will always be '' (empty string). However, it
          " can be the case that `has('clipboard_working')` is false, yet `+` is
          " still distinct, so we want to check them all.
          let s:VimOSCYankPostRegisters = ['', '+', '*']
          " copy text to clipboard on both (y)ank and (d)elete
          let s:VimOSCYankOperators = ['y', 'd']
          function! s:VimOSCYankPostCallback(event)
              if index(s:VimOSCYankPostRegisters, a:event.regname) != -1
                  \ && index(s:VimOSCYankOperators, a:event.operator) != -1
                  call OSCYankRegister(a:event.regname)
              endif
          endfunction
          augroup VimOSCYankPost
              autocmd!
              autocmd TextYankPost * call s:VimOSCYankPostCallback(v:event)
          augroup END
      endif
    ]])
  end,
}
