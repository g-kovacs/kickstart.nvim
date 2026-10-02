return {
  'isakbm/gitgraph.nvim',
  dependencies = {
    'sindrets/diffview.nvim',
  },

  opts = {
    symbols = {
      merge_commit = 'M',
      commit = '*',
    },
  },

  keys = {
    {
      '<leader>gl',
      function()
        require('gitgraph').draw({}, { all = true, max_count = 5000 })
      end,
      desc = '[G]it Graph: Al[l] branches',
    },
  },
}
