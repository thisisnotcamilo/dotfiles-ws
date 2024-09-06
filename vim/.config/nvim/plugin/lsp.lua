local lsp = require('lsp-zero')
lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'tsserver', 'eslint', 'lua_ls'},
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping.confirm({ select = true }),
    })
})


lsp.set_preferences({
	sign_icons = { }
})

-- deprecated, replaced by nvim_workspace
lsp.nvim_lua_ls()

lsp.setup()
