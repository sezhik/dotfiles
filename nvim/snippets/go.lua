local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("ew", { -- триггер
    t('fmt.Errorf("'),
    i(1, "msg"),
    t(': %w", err)'),
    i(0),
  }),
}
