return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = "make install_jsregexp",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets" } })
			end,
		},
	},
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<C-j>"] = { "select_and_accept" },
			["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-l>"] = { "snippet_forward" },
			["<C-h>"] = { "snippet_backward" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = { documentation = { auto_show = false } },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		snippets = { preset = "luasnip" },
	},
	opts_extend = { "sources.default" },
}
-- vim: ts=2 sts=2 sw=2 et
