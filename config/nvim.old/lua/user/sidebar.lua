local sidebar_ok, sidebar = pcall(require, "sidebar-nvim")

if not sidebar_ok then
	return
end

-- See: https://github.com/sidebar-nvim/sidebar.nvim

sidebar.setup({
	disable_default_keybindings = 0,
	bindings = nil,
	open = false,
	side = "left",
	initial_width = 55,
	hide_statusline = false,
	update_interval = 500,
	sections = {
		-- "datetime",
		-- "git",
		-- "todos",
		"diagnostics",
		"symbols",
	},
	section_separator = "-----",
	containers = {
		attach_shell = "/usr/bin/fish",
		show_all = true,
		interval = 5000,
	},
	datetime = {
		format = "%a %b %d, %H:%M",
		clocks = { { name = "local" } },
	},
	todos = {
		ignored_paths = { "~" },
		icon = "",
		initially_closed = false,
	},
	disable_closing_prompt = false,
})
