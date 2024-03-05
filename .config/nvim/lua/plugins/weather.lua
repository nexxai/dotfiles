return {
  "lazymaniac/wttr.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    location = "Calgary+Canada",
    format = 1,
    custom_format = "%C+%cP:%p+T:%t+F:%f+%w+%m",
  },

  keys = {
    {
      "<leader>W",
      function()
        require("wttr").get_forecast() -- show forecast for my location
      end,
      desc = "Weather Forecast",
    },
  },
}
