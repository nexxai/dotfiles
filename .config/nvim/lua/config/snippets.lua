local ok, ls = pcall(require, "luasnip")
if not ok then
  return
end

local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local types = require("luasnip.util.types")

-- options
ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  store_selection_keys = "<c-s>",
  ext_opts = {
    [types.insertNode] = {
      visited = { hl_group = "Comment" },
      unvisited = { hl_group = "Comment" },
    },
    [types.choiceNode] = {
      active = {
        virt_text = { { "●", "InsertMode" } },
      },
    },
  },
})

-- commands
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true, desc = "🚀snip jump to next placeholder" })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.expand_or_jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true, desc = "🚀snip jump to prev placeholder" })

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { desc = "🚀snip next choice" })

vim.keymap.set({ "i", "s" }, "<C-h>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end, { desc = "🚀snip prev choice" })

-- snippets
local snips = {
  php = {
    s(
      { trig = "beforeEach", name = "beforeEach() Pest function" },
      fmt(
        [[
        beforeEach(function(){{
            $this->{};
        }});
        ]],
        {
          i(1),
        }
      )
    ),
    s(
      { trig = "__construct", name = "php constructor" },
      fmt(
        [[
          public function __construct({})
          {{
            {}
          }}

        ]],
        {
          i(1),
          i(2),
        }
      )
    ),
    s(
      { trig = "class", name = "php class" },
      fmt(
        [[
        <?php

        class {}
        {{
          {}
        }}
        ]],
        {
          i(1),
          i(2),
        }
      )
    ),
    s(
      { trig = "<?", name = "php file" },
      fmt(
        [[
        <?php

        {}
        ]],
        {
          i(1),
        }
      )
    ),
    s(
      { trig = "todo", name = "pest todo" },
      fmt(
        [[
        it('{}', function() {{
        }})->todo();

        ]],
        {
          i(1),
        }
      )
    ),
    s(
      { trig = "fun", name = "public function ()" },
      fmt(
        [[
          public function {}({}): {}
          {{
            {}
          }}
        ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
        }
      )
    ),
    s(
      { trig = "test", name = "Pest test" },
      fmt(
        [[
        test('{}', function() {{
          expect({})->toBe{}({});
        }});

        ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
        }
      )
    ),
    s(
      { trig = "it", name = "Pest test" },
      fmt(
        [[
        it('{}', function() {{
          expect({})->toBe{}({});
        }});
        ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
        }
      )
    ),
  },
  markdown = {
    s(
      {
        trig = "link",
        name = "Create markdown link [txt](url)",
      },
      fmt("[{}]({})", {
        i(1, "description"),
        f(function(_, snip)
          return snip.env.TM_SELECTED_TEXT[1] or {}
        end, {}),
      })
    ),
    s(
      {
        trig = "lang",
        name = "code block markdown language",
      },
      fmt(
        [[
				```{}

				{}
				```
				]],
        { i(1, "language"), i(2, "body") }
      )
    ),
  },
  zsh = {
    s({
      trig = "var",
      name = "variable indicator",
    }, fmt('"${}"', i(1, "var"))),
  },
}

-- add snips to engine
ls.add_snippets(nil, {
  markdown = snips.markdown,
  zsh = snips.zsh,
  php = snips.php,
})

local list_snips = function()
  local ft_list = require("luasnip").available()[vim.o.filetype]
  local ft_snips = {}
  for _, item in pairs(ft_list) do
    ft_snips[item.trigger] = item.name
  end
  P(ft_snips)
end

vim.api.nvim_create_user_command("SnipList", list_snips, {})
