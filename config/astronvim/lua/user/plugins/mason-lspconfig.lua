-- use mason-lspconfig to configure LSP installations
return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		automatic_installation = true,
		ensure_installed = {
			-- "black",
			"tflint",
			-- "terraformls",
			"marksman",

			-- "clangd",
			-- "cssls",
			"html",
			-- "marksman",
			"jsonls",
			"pyright",
			-- "sqlls",
			"lua_ls",
			"tsserver",
			"yamlls",
		},
	},
}
