local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    "clangd",
    "cmake",
    "sumneko_lua",
    "marksman",
    "rust_analyzer",
    "jsonls",
    "yamlls",
  },
  automatic_installation = true,
})
