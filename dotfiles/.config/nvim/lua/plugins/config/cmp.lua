return 
{
	{
  		'saghen/blink.cmp',
  		-- optional: provides snippets for the snippet source
  		dependencies = { 'rafamadriz/friendly-snippets' },

  		-- use a release tag to download pre-built binaries
  		version = '1.*',
  		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  		-- build = 'cargo build --release',
  		-- If you use nix, you can build from source using latest nightly rust with:
  		-- build = 'nix run .#build-plugin',

  		---@module 'blink.cmp'
  		---@type blink.cmp.Config
  		opts = {
    		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    		-- 'super-tab' for mappings similar to vscode (tab to accept)
    		-- 'enter' for enter to accept
    		-- 'none' for no mappings

    		-- See :h blink-cmp-config-keymap for defining your own keymap
    		keymap = { 
					preset = 'super-tab',
					['<M-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
					['<M-e>'] = { 'hide', 'fallback' },
					['<Tab>'] = { 'select_and_accept', 'fallback' },
					--[[
					['<Up>'] = { 'select_prev', 'fallback' },
					['<Down>'] = { 'select_next', 'fallback' },
					['<M-p>'] = { 'select_prev', 'fallback_to_mappings' },
					['<M-n>'] = { 'select_next', 'fallback_to_mappings' },

					['<M-b>'] = { 'scroll_documentation_up', 'fallback' },
					['<M-f>'] = { 'scroll_documentation_down', 'fallback' },

					['<Tab>'] = { 'snippet_forward', 'fallback' },
					['<S-Tab>'] = { 'snippet_backward', 'fallback' },

					['<M-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
					]]
				},

    		appearance = {
      		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      		-- Adjusts spacing to ensure icons are aligned
      			nerd_font_variant = 'ubuntu'
    		},

    		-- (Default) Only show the documentation popup when manually triggered
    		completion = {
					documentation = {
						auto_show = true,
						auto_show_delay_ms = 200,
					},
					keyword = {
						range = "prefix",
					},
					list = {
						selection = {
							preselect = false,
							auto_insert = false,
						},
					},
					accept = {
						auto_brackets = {
							enabled = true,
						}
					},
					ghost_text = {
						enabled = true,
						auto_show = true,
						show_without_selection = true,
						show_with_menu = true,
						show_without_menu = true,
					},
			},
			-- Default list of enabled providers defined so that you can extend it
    		-- elsewhere in your config, without redefining it, due to `opts_extend`
    		sources = {
      			default = { 'lsp', 'path', 'snippets', 'buffer' },
    		},

    		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    		--
    		-- See the fuzzy documentation for more information
    		fuzzy = { implementation = "prefer_rust_with_warning" }
  		},
		opts_extend = { "sources.default" }
	},
}
