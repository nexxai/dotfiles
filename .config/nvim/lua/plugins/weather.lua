return {
  "lazymaniac/wttr.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    location = "Calgary+Canada",
    format = 2,
    custom_format = "%C+%cP:%p+T:%t+F:%f+%w+%m",
  },
}
