
call plug#begin('/home/tnn/.local/share/nvim/plugged')
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive', { 'for': 'clojure' }
Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf', { 'dir': '~/fzf', 'do': './install --all' }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'

Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/sonokai'

Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'plasticboy/vim-markdown'

Plug 'posva/vim-vue'
Plug 'norcalli/nvim-colorizer.lua'

" code completion
Plug 'neoclide/coc.nvim'
" coc-python not compatible with coc-jedi
"Plug 'neoclide/coc-python', { 'do': 'yarn install --frozen-lockfile' }

Plug 'neoclide/coc-tabnine', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-yaml', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile' }

"Plug 'neoclide/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
"Plug 'neoclide/coc-pyright'

" Plug 'neoclide/coc-pairs'

" status line
Plug 'itchyny/lightline.vim'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" autocompletion
"Plug 'prabirshrestha/vim-lsp'
"if has('nvim')
"    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"    Plug 'Shougo/deoplete.nvim'
"    Plug 'roxma/nvim-yarp'
"    Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1
"Plug 'lighttiger2505/deoplete-vim-lsp'

" lsp highlight
Plug 'jackguo380/vim-lsp-cxx-highlight'

" tags
Plug 'ludovicchabant/vim-gutentags'

" auto pairs
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'


" NERD commenter
Plug 'preservim/nerdcommenter'

" smart tabs or spaces
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'

Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'

" C++ code format
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" auto complete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'


call plug#end()

runtime coc-init.vim


" ---------- setup theme -----------------
if(has("termguicolors"))
	set termguicolors
endif
set background=dark
colorscheme gruvbox

" editor settings
syntax enable
set encoding=utf-8
set modelines
set printoptions=number:y
set ff=unix
set linebreak
set number
set softtabstop=4
set shiftwidth=4	" indent by this much when using >>, <<
set tabstop=4
set expandtab

set ai sw=4
set cindent
set smartindent

set showmatch
set incsearch
" set ignorecase
set smartcase
set hlsearch

set wrap
set textwidth=70
set formatoptions=qrnl

set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest
set ruler
set ttyfast

set showcmd
set showmode

let g:python3_host_prog="~/bin/venvs/neovim/bin/python"

" ------------- for vim-lsp --------------
if executable('ccls')
    au User lsp_setup call lsp#register_server({
	  \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(
      \   lsp#utils#find_nearest_parent_file_directory(
      \     lsp#utils#get_buffer_path(), ['.ccls', 'compile_commands.json', '.git/']))},
      \ 'initialization_options': {
      \   'highlight': { 'lsRanges' : v:true },
      \   'cache': {'directory': stdpath('cache') . '/ccls' },
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \})
endif


"------------ for gutentags --------------
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"------------ compile and run ------------
nnoremap <silent> <buffer> <F8> :call <SID>compile_run_cpp()<CR>

function! s:compile_run_cpp() abort
	let src_path = expand('%:p:~')
	let src_noext = expand('%:p:~:r')
	" The building flags
	let _flag = '-Wall -Wextra -std=c++11 -O2'

	if executable('clang++')
		let prog = 'clang++'
	elseif executable('g++')
		let prog = 'g++'
	else
		echoerr 'No compiler found!'
	endif

	call s:create_term_buf('v', 80)
	execute printf('term %s %s %s -o %s && %s', prog, _flag, src_path, src_noext, src_noext)
	startinsert
endfunction

function s:create_term_buf(_type, size) abort
	set splitbelow
	set splitright
	if a:_type ==# 'v'
		vnew
	else
		new
	endif
	execute 'resize ' . a:size
endfunction

" ------------ ALE -------------
let g:ale_fixers = {
    \ 'javascript': ['eslint'],
    \ '': ['clang-format']
    \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1


" COC
" " COC extension
let g:coc_user_config = {}
let g:coc_global_extensions = [
      \ 'coc-emmet', 
      \ 'coc-css', 
      \ 'coc-html', 
      \ 'coc-json', 
      \ 'coc-prettier', 
      \ 'coc-tsserver', 
      \ 'coc-snippets', 
      \ 'coc-eslint']
" " To go back to previous state use Ctrl+O
nmap <silent><leader>gd <Plug>(coc-definition)
nmap <silent><leader>gy <Plug>(coc-type-definition)
nmap <silent><leader>gi <Plug>(coc-implementation)
nmap <silent><leader>gr <Plug>(coc-references)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh() 

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" " Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected

augroup mygroup
  autocmd!
  " " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" " Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


"------------ syntastic -------------------
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'

" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" CPP setup done using this tutorial https://xuechendi.github.io/2019/11/11/VIM-CPP-IDE-2019-111-11-VIM_CPP_IDE
" Code formatting
autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format

