local opt = vim.opt

-- Highlight numbers only
opt.cursorline = true
opt.cursorlineopt = "number"

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

local vscode_status, vscode = pcall(require, "vscode")
if not vscode_status then
  return
end

local colors_status, colors = pcall(require, "vscode.colors")
if not colors_status then
  return
end

vscode.setup({
  transparent = true,
  italic_comments = true,
  disable_nvimtree_bg = true
})
