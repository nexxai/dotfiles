-- the opts function can also be used to change the default opts:
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, "😄")
  end,
  config = function()
    require("lualine").setup({
      sections = {
        lualine_x = { "require'wttr'.text" },
      },
    })
  end,
}
