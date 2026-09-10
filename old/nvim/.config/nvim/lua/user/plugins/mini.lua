return {
  'echasnovski/mini.nvim',
  version = false,
  init = function ()
    require('mini.trailspace').setup()
    vim.cmd('au FileType c,cpp,java,php,python,javascript,typescript,vim,swig,ocaml au BufWritePre <buffer> :%s/\\s\\+$//e|norm!``')
  end,
}
