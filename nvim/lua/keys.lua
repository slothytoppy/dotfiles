vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
vim.keymap.set("n", "<leader>vrr", "<cmd> lua vim.lsp.buf.references()<cr>")
vim.keymap.set("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
vim.keymap.set("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<cr>")

vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>Telescope git_files<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>ph", "<cmd>Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>ps", function()
	require("telescope.builtin").grep_string({
		search = vim.fn.input("Grep String > "),
	})
end)

vim.keymap.set("n", "<leader>x", "<cmd>TroubleToggle<CR>")
vim.keymap.set("n", "-", "<cmd>Neotree position=current<cr>")

vim.keymap.set("n", "<S-q>", "<cmd>Neotree toggle<CR>")

vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>")

local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup({})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():append()
end)

--vim.keymap.set("n", "<C-e>", function()
--	harpoon.ui:toggle_quick_menu(harpoon:list())
--end)

vim.keymap.set("n", "<C-g>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-t>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-n>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-s>", function()
	harpoon:list():select(4)
end)

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<C-e>", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

harpoon:extend({
	UI_CREATE = function(cx)
		vim.keymap.set("n", "<C-v>", function()
			harpoon.ui:select_menu_item({ vsplit = true })
		end, { buffer = cx.bufnr })

		vim.keymap.set("n", "<C-x>", function()
			harpoon.ui:select_menu_item({ split = true })
		end, { buffer = cx.bufnr })

		vim.keymap.set("n", "<C-t>", function()
			harpoon.ui:select_menu_item({ tabedit = true })
		end, { buffer = cx.bufnr })
	end,
})
