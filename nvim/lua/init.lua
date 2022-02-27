local servers = {
  ['clangd'] = { 'clangd' },
  ['pyright'] = { 'pyright-langserver', '--stdio' },
  ['rust_analyzer'] = { 'rustup', 'run', 'nightly', 'rust-analyzer' },
  ['tsserver'] = { 'typescript-language-server', '--stdio' },
}

local opts = { noremap=true, silent=true }
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = "double" }
)

for lsp, cmd in pairs(servers) do
  require ('lspconfig')[lsp].setup {
    cmd = cmd,
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
  }
end
