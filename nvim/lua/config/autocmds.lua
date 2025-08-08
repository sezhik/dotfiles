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
  local ok, cmp = pcall(require, "cmp")
  local in_snippet = ok and cmp and cmp.snippet_active() or false

  if not in_snippet and vim.bo.modified and vim.bo.modifiable and not vim.bo.readonly then
    vim.cmd("silent! write")
  end
end

local delay = 1500 -- ms
local save_debounced = debounce(save, delay)

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, { callback = save_debounced })
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, { callback = save })
vim.api.nvim_create_autocmd({ "InsertEnter" }, { callback = stop_timer })
