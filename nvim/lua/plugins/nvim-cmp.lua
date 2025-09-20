return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  opts = function(_, opts)
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load({
      paths = vim.fn.stdpath("config") .. "/snippets",
    })

    opts.window = {
      completion = cmp.config.window.bordered({
        border = "rounded",
        winhighlight = "Normal:Pmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
        scrollbar = false,
      }),
      documentation = cmp.config.window.bordered({
        border = "rounded",
        winhighlight = "Normal:Pmenu,FloatBorder:CmpDocBorder,CursorLine:PmenuSel,Search:None",
      }),
    }

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local function after_dot_context()
      local row, col = unpack(vim.api.nvim_win_get_cursor(0)) -- col: 0-индекс
      local line = vim.api.nvim_get_current_line()
      local prefix = line:sub(1, col) -- всё слева от курсора

      -- найдём текущее "слово" под курсором (буквы/цифры/_)
      local s, e, word = prefix:find("([%w_]+)$")
      if not s then
        -- слова ещё нет (только что поставили точку)
        return prefix:sub(-1) == "."
      end
      if s == 1 then
        return false
      end
      -- символ прямо перед началом слова
      return prefix:sub(s - 1, s - 1) == "."
    end

    -- фильтр для сниппетов
    local function snippet_filter(entry, ctx)
      if entry.source.name ~= "luasnip" then
        return true
      end
      local is_postfix = entry.completion_item and entry.completion_item.postfix

      if after_dot_context() then
        -- после точки → показываем только postfix-сниппеты
        return is_postfix
      else
        -- в других местах → убираем postfix, оставляем обычные
        return not is_postfix
      end
    end

    -- Комфортные клавиши (supertab-поведение)
    opts.mapping = opts.mapping or {}
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.in_snippet() and luasnip.jumpable(1) then
          luasnip.jump(1)
          return
        end

        if cmp.visible() then
          cmp.confirm({ select = true })
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    })
    -- -- Не автокомплитить в комментариях
    -- local ctx = require("cmp.config.context")
    -- opts.enabled = function()
    --   if vim.bo.buftype == "prompt" then
    --     return false
    --   end
    --   return not ctx.in_treesitter_capture("comment") and not ctx.in_syntax_group("Comment")
    -- end

    -- Сортировка: опусти сниппеты ниже LSP
    -- opts.sorting = {
    --   priority_weight = 2,
    --   comparators = {
    --     cmp.config.compare.locality,
    --     cmp.config.compare.exact,
    --     cmp.config.compare.score,
    --     function(e1, e2)
    --       local K = cmp.lsp.CompletionItemKind
    --       local s1 = e1:get_kind() == K.Snippet
    --       local s2 = e2:get_kind() == K.Snippet
    --       if s1 ~= s2 then
    --         return not s1
    --       end -- сниппеты ниже
    --     end,
    --     cmp.config.compare.kind,
    --     cmp.config.compare.length,
    --     cmp.config.compare.order,
    --   },

    opts.snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    }

    opts.sources = cmp.config.sources({
      { name = "lazydev" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "luasnip", entry_filter = snippet_filter },
    }, {
      { name = "buffer" },
    })

    return opts
  end,
}
