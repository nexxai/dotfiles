return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          always_show = {
            ".env",
            ".gitignore",
          },
        },
      },
    })
  end,
}
