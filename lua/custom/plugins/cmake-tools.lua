return {
  'Civitasv/cmake-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },

  keys = {
    { '<leader>mg', '<cmd>CMakeGenerate<cr>', desc = 'CMake: Generate' },
    { '<leader>mr', '<cmd>CMakeGenerate!<cr>', desc = 'CMake: Clean cache + regenerate' },
    { '<leader>mb', '<cmd>CMakeBuild<cr>', desc = 'CMake: Build' },
    { '<leader>mt', '<cmd>CMakeSelectBuildTarget<cr>', desc = 'CMake: Select target' },
    { '<leader>mk', '<cmd>CMakeSelectKit<cr>', desc = 'CMake: Select kit' },
    { '<leader>my', '<cmd>CMakeSelectBuildType<cr>', desc = 'CMake: Build type' },
    { '<leader>mc', '<cmd>CMakeClean<cr>', desc = 'CMake: Clean' },
    { '<leader>mx', '<cmd>CMakeStopExecutor<cr>', desc = 'CMake: Stop build' },
    { '<leader>ms', '<cmd>CMakeStopRunner<cr>', desc = 'CMake: Stop run' },
  },

  opts = {
    cmake_build_directory = 'build',

    cmake_build_options = {
      '--parallel',
      '12',
    },

    cmake_executor = {
      name = 'quickfix',
      opts = {},
      default_opts = {
        quickfix = {
          show = 'always',
          position = 'belowright',
          size = 10,
        },
      },
    },

    cmake_runner = {
      name = 'terminal',
      opts = {},
      default_opts = {
        terminal = {
          name = 'Main Terminal',
          prefix_name = '[CMakeTools]: ',
          split_direction = 'horizontal',
          split_size = 11,
        },
      },
    },
  },
}
