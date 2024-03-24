local opts = {
  notify_on_switch = false,
  auto_set_mode_filetype_allowlist = {
    "asciidoc",
    "gitcommit",
    "latex",
    "mail",
    "markdown",
    "rst",
    "tex",
    "text",
    "blade",
    "php",
  },
}

return {
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup(opts)
    end,
  },
}
