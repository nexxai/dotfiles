return {
  "TobinPalmer/rayso.nvim",
  cmd = { "Rayso" },
  config = function()
    require("rayso").setup({
      open_cmd = "Arc",
      base_url = "https://ray.so/",
      options = {
        background = true,
        dark_mode = true,
        theme = "breeze",
        logging_enabled = true,
        logging_path = "/Users/nexxai/Documents/Rayso/",
        logging_file = "rayso.md",
        title = "nexxai",
        padding = 32,
      },
    })
  end,
}
