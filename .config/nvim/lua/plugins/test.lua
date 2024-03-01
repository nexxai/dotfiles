return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "theutz/neotest-pest",
      -- "V13Axel/neotest-pest",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-pest")({
            pest_cmd = function()
              return "vendor/bin/pest"
            end,
            sail_enabled = false,
          }),
        },
      })
    end,
  },
}
