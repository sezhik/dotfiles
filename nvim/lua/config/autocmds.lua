-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local timer = nil

local function stop_timer()
  if timer then
    timer:stop()
    timer:close()
    timer = nil
  end
end

local function debounce(func, delay)
  local args = nil

  return function(...)
    args = { ... }

    stop_timer()
    timer = vim.uv.new_timer()
    timer:start(
      delay,
      0,
      vim.schedule_wrap(function()
        func(unpack(args))
        timer:close()
        timer = nil
      end)
    )
  end
end

local function save()
  local ok, luasnip = pcall(require, "luasnip")
  local in_snippet = ok and luasnip and luasnip.in_snippet() or false

  if not in_snippet and vim.bo.modified and vim.bo.modifiable and not vim.bo.readonly then
    vim.cmd("silent! write")
  end
end

local delay = 1500 -- ms
local save_debounced = debounce(save, delay)

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, { callback = save_debounced })
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, { command = "silent! update", pattern = "*" })
vim.api.nvim_create_autocmd({ "InsertEnter" }, { callback = stop_timer })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params(0, "utf-8")
    params.context = { only = { "source.organizeImports" } }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local arg = vim.fn.argv(0)
    if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
      vim.cmd("cd " .. arg)
    end
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc" }, -- Apply to both .json and .jsonc files
  callback = function()
    vim.opt.conceallevel = 2 -- Set conceallevel to 0 for no concealing
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" }, -- Apply to both .json and .jsonc files
  callback = function()
    vim.opt.conceallevel = 0 -- Set conceallevel to 0 for no concealing
    vim.opt.spell = false
  end,
})
