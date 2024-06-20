return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    opts = { reveal = true, buffers = { follow_current_file = { enabled = true }}, filesystem = { follow_current_file = { enabled = true }}  },
      -- require("plugins.configs.neo-tree.nvim")(plugin, opts)
    --   opts.position = "current"
    --   opts.reveal = true
    --   opts.reveal_force_cwd = true
    --   opts.filesystem.follow_current_file = true
    --   return opts
    -- end,
    config = function(_, opts)
      require("neo-tree").setup(opts)
    end,
  }
}
