return {
	-- a list of all tools you want to ensure are installed upon
	-- start; they should be the names Mason uses for each tool
	ensure_installed = {
		-- LSPs
		"vala-language-server",
		"bash-language-server",
		-- "shellcheck",
		"clangd",
		"lua-language-server",
		"rust-analyzer",
		"css-lsp",
		"html-lsp",
		"json-lsp",
		"dockerfile-language-server",
		"docker-compose-language-service",
		-- "docker-language-server", -- Not working?
		"pyright",
		"texlab",
		"mesonlsp",
		"gh-actions-language-server",
		"yaml-language-server",
		"efm",

		-- Linters/Formatters
		-- Linters
		"markdownlint",
		"cpplint",

		-- Formatters
		"luaformatter",
		"clang-format",
		"latexindent",
		"prettierd", -- npm install -D prettier prettier-plugin-jinja-template
	},
	auto_update = false,
}
