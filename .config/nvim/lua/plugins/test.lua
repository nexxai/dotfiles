return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "theutz/neotest-pest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-pest"),
        },
      })
    end,
  },
}
