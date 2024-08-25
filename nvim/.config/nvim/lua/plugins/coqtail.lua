return {
  { 
    "whonore/Coqtail",
    init = function ()
      vim.api.nvim_create_autocmd("FileType", {
        desc = "Coq keybindings",
        pattern = "coq",
        callback = function(event)
          vim.cmd "map <buffer> L <Plug>CoqNext <Plug>CoqJumpToEnd"
          vim.cmd "map <buffer> H <Plug>CoqUndo <Plug>CoqJumpToEnd"
        end,
        pattern = "coq",
      })
    end,
  }
}
