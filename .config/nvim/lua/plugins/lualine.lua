-- the opts function can also be used to change the default opts:
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    vim.g.VM_set_statusline = 0
    vim.g.VM_silent_exit = 1
    table.insert(opts.sections.lualine_x, "😄")
  end,
  config = function()
    require("lualine").setup({
      sections = {
        lualine_a = {
          {
            "mode",
            -- If visual multi is active, show the mode in white and red
            -- and show it as the active mode
            color = function()
              return {
                fg = vim.b["visual_multi"] and "white" or nil,
                bg = vim.b["visual_multi"] and "red" or nil,
              }
            end,
            fmt = function(mode)
              return vim.b["visual_multi"] and "VM - MULTI" or mode
            end,
          },
        },
        lualine_b = { "diff", "diagnostics" },
        lualine_x = { "require'wttr'.text" },
      },
    })
  end,
}
