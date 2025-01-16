return {
  'echasnovski/mini.nvim',
  version = false,
  init = function ()
    require('mini.trailspace').setup()
    vim.cmd('au FileType * au BufWritePre <buffer> :lua MiniTrailspace.trim()')
  end,
}
