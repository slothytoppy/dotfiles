return {
	"tpope/vim-fugitive",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<leader>gc", function()
			vim.cmd("Git commit")
		end)
	end,
}
