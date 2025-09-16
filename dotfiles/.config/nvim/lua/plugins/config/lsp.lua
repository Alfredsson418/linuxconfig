return  {
	{	
		'neovim/nvim-lspconfig',
 		dependencies = { 'saghen/blink.cmp' },

 	 	-- example using `opts` for defining servers
  		opts = {
    		servers = {
				vala_ls = {},
				bashls = {},
      			clangd = {},
				lua_ls = {},
				rust_analyzer = {},
				cssls = {},
				html = {},
				jsonls = {},
				dockerls = {}, -- Dockerfile
				docker_compose_language_service = {},
				-- docker_language_server = {},
				pyright = {},
				texlab = {},
				mesonlsp = {},
				gh_actions_ls = {},
				yamlls = {},
    		}
  		},
  		config = function(_, opts)
    		local lspconfig = require('lspconfig')
    		for server, config in pairs(opts.servers) do
      			-- passing config.capabilities to blink.cmp merges with the capabilities in your
      			-- `opts[server].capabilities, if you've defined it
      			config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      			lspconfig[server].setup(config)
    		end
  		end
	}
}
