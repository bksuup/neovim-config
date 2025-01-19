return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- lazydev is only for editing the nvim config files and is optional af
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						-- Load luvit types when the `vim.uv` word is found
						{ path = "luvit-meta/library", words = { "vim%.uv" } },
					},
				},
			},

			-- Installing and configuring LSP-servers
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- autoformating
			"stevearc/conform.nvim",
		},

		config = function()
			local mason_tool_installer = require("mason-tool-installer")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

			-- call mason setup function
			require("mason").setup()

			-- Ensure wanted lsp's are installed
			mason_lspconfig.setup({
				automatic_installation = true,
				ensure_installed = {
					"lua_ls",
				},
			})

			-- ensure wanted tools are installed
			mason_tool_installer.setup({
				ensure_installed = {
					"stylua",
				},
			})

			lspconfig.lua_ls.setup({})

			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
				},
				format_on_save = {
					timeout_ms = 500,
				},
			})
		end,
	},
}
