return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Hunk forward" })

				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Hunk backward" })

				-- Actions
				map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset hunk" })
				map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "Stage buffer" })
				map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "Reset buffer" })
				map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "Preview hunk" })
				map("n", "<leader>ghd", gitsigns.preview_hunk_inline, { desc = "Diff hunk inline" })

				map("n", "<leader>gb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame line" })

				map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff this" })

				map("n", "<leader>gD", function()
					gitsigns.diffthis("~")
				end, { desc = "Diff this" })

				map("n", "<leader>gQ", function()
					gitsigns.setqflist("all")
				end, { desc = "Set qf list all" })

				map("n", "<leader>gq", gitsigns.setqflist, { desc = "Set qf list" })

				-- Toggles
				map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
				map("n", "<leader>gtw", gitsigns.toggle_word_diff, { desc = "Toggle word fidff" })

				-- Text object
				map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select hunk" })
			end,
		})
	end,
}
