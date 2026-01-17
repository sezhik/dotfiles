return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.bracketed").setup()

		require("mini.basics").setup({
			options = {
				extra_uid = true,
				win_borders = "double",
			},
		})

		local icons = require("mini.icons")
		icons.setup()
		icons.mock_nvim_web_devicons()

		local ai = require("mini.ai")
		ai.setup({
			custom_textobjects = {
				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
				e = ai.gen_spec.treesitter({ a = "@assignment.outer", i = "@assignment.inner" }), -- class
			},
		})
	end,
}
