return {
	------ disabled ---------
	{ "goolord/alpha-nvim", enabled = false },
	{ "Darazaki/indent-o-matic", enabled = false },

	------- added -------
	{
		"onsails/lspkind.nvim",
		opts = function(_, opts)
			-- use codicons preset
			opts.preset = "codicons"
			-- set some missing symbol types
			opts.symbol_map = {
				Array = "",
				Boolean = "",
				Key = "",
				Namespace = "",
				Null = "",
				Number = "",
				Object = "",
				Package = "",
				String = "",
			}
			return opts
		end,
	},
	{ "Glench/Vim-Jinja2-Syntax" },
	{ "lukoshkin/trailing-whitespace" },
	{ "Vimjas/vim-python-pep8-indent" },

	{ "folke/tokyonight.nvim" },
	{ "folke/trouble.nvim", cmd = "TroubleToggle" },
	{
		"folke/todo-comments.nvim",
		event = "User AstroFile",
		config = true,
	}, -- TODO: stuff

	{ "dag/vim-fish" }, -- basic fish syntax awareness
	{ "isobit/vim-caddyfile" },

	-- { "echasnovski/mini.nvim", branch = "stable" },
	{ "Vonr/align.nvim" },

	{
		"ethanholz/nvim-lastplace",
		event = "BufRead",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit",
					"gitrebase",
					"svn",
					"hgcommit",
				},
				lastplace_open_folds = true,
			})
		end,
	},

	{
		"github/copilot.vim",
		enabled = true,
		cmd = "Copilot",
	},

	{
		"kcl-lang/vim-kcl",
		init = function()
			vim.api.nvim_command([[autocmd BufRead,BufNewFile *.k set filetype=kcl]])
		end,
		ft = {
			"kcl",
		},
	},

	{
		"joerdav/templ.vim",
		init = function()
			vim.api.nvim_command([[autocmd BufRead,BufNewFile *.templ set filetype=templ]])
		end,
		ft = {
			"templ",
		},
	},

	{
		"gsuuon/note.nvim",
		opts = {
			-- Spaces are note roots. These directories should contain a `./notes` directory (will be made if not).
			-- Defaults to { '~' }.
			spaces = {
				"~",
				-- '~/projects/foo'
			},

			-- Set keymap = false to disable keymapping
			-- keymap = {
			--   prefix = '<leader>n'
			-- }
		},
		cmd = "Note",
		ft = "note",
	},
	-- end
}
