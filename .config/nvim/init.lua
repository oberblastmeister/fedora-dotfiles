opt = vim.opt
opt_local = vim.opt_local
keymap = vim.keymap

opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

if vim.g.vscode then
  vim.cmd[[
  nnoremap <C-j> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
  xnoremap <C-j> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
  nnoremap <C-k> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
  xnoremap <C-k> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
  nnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
  xnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
  nnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
  xnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
  xnoremap <C-w>p <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
  nnoremap <C-w>p <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
  ]]
else
  vim.cmd[[
  
  ]]
end

