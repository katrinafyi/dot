return {
  { 
    "whonore/Coqtail",
    branch = "checked-region-autocmd",
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

      -- vim.g.asdf = false;
      -- vim.api.nvim_create_autocmd("User", {
      --   pattern = "CoqCommandComplete",
      --   desc = "Coqtail follow checked",
      --   callback = function(event)
      --     if not vim.g.asdf then
      --       vim.g.asdf = true
      --       vim.cmd "CoqJumpToEnd"
      --       vim.g.asdf = false
      --     end
      --   end,
      -- })
      --
      -- vim.api.nvim_exec([[
		    -- let g:coqautocommanding = v:false
      --   augroup CoqtailFollowChecked
		    --   autocmd!
		    --   autocmd! User CoqCommandComplete
		    --     \  if ! g:coqautocommanding && g:coqtail#event.cmd =~# 'step\|rewind\|to_line\|to_top'
		    --     \|   let g:coqautocommanding = v:true
			   --    \|   CoqJumpToEnd
		    --     \|   let g:coqautocommanding = v:false
			   --    \| endif
		    -- augroup END
      -- ]], false)
    end,
  }
}
