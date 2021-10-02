" Ex: 3<leader>tl will clear neoterm-3
nnoremap <leader>tl :<c-u>exec v:count.'Tclear'<cr>

" make new terminal open at bottom right
let g:neoterm_default_mod = 'botright'
