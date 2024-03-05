vim.keymap.set("n", "<leader>t", "function() require('neotest').run.run() end")
vim.keymap.set("n", "<leader>tt", "function() require('neotest').run.run(vim.fn.expand('%')) end")
vim.keymap.set("n", "<leader>tf", function()
  require("neotest").run.run({ suite = true })
end)
vim.keymap.set("n", "<leader>ts", "function() require('neotest').summary.open() end")

return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "V13Axel/neotest-pest",
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
            sail_enabled = function()
              return false
            end,
          }),
        },
      })
    end,
  },
}
