return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				vim.diagnostic.config({ virtual_text = false, signs = false, underline = false })
				vim.opt.formatoptions:remove({ "c", "r", "o" })

				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")

				map("<leader>id", function()
					if vim.diagnostic.config().virtual_text then
						vim.diagnostic.config({ virtual_text = false, signs = false, underline = false })
					else
						vim.diagnostic.config({ virtual_text = true, signs = true, underline = true })
					end
				end, "Toggle [I]nline [D]iagnostics")
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())
		vim.lsp.config("*", { capabilities = capabilities })

		vim.lsp.config("rust_analyzer", {
			cmd = { "rustup", "run", "stable", "rust-analyzer" },
		})
		vim.lsp.config("ruff", {})
		vim.lsp.enable({ "rust_analyzer", "ruff" })
	end,
}
-- vim: ts=2 sts=2 sw=2 et
