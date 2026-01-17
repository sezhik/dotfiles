local function get_go_module_path()
	if vim.fn.executable("go") ~= 1 then
		return nil
	end

	local module = vim.fn.trim(vim.fn.system("go list -m"))
	if vim.v.shell_error ~= 0 then
		return nil
	end

	module = module:gsub("\n", ",")

	return module
end

local function add_local(_)
	local module_path = get_go_module_path()
	if not module_path then
		return {}
	end

	return { "-local", module_path }
end

local function goimports_if_clean()
	local diagnostics = vim.diagnostic.get(0) or {}
	for _, d in ipairs(diagnostics) do
		if d.severity == vim.diagnostic.severity.ERROR then
			return "true" -- есть ошибки, не форматируем тк goimports в этом случае очень медленно работает
		end
	end

	return "goimports"
end

return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			goimportsLocalFast = {
				command = goimports_if_clean,
				args = add_local,
				stdin = true,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			-- go = { "goimportsLocalFast" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
