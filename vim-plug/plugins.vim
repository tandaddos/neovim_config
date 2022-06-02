" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    " Themes
    "   onedark
    "   material
    Plug 'joshdick/onedark.vim'
    Plug 'kaicataldo/material.vim'

    " intellisense
"    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Startify
    Plug 'mhinz/vim-startify'

    " ranger
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

    " fzf and vim-rooter
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }    
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

    " colorizer
    Plug 'norcalli/nvim-colorizer.lua'

    " rainbow parentheses
    Plug 'junegunn/rainbow_parentheses.vim'

    " git stuff
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'airblade/vim-gitgutter'

    " which key
    Plug 'liuchengxu/vim-which-key'

    " neovim native lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'

    " Goyo is distraction-free mode
    Plug 'junegunn/goyo.vim'

    " limelight dims all lines except current line
    Plug 'junegunn/limelight.vim'

    " tabular is used to format tables in markdown
    Plug 'godlygeek/tabular'

    " json front matter
    Plug 'elzr/vim-json'

    " markdown plugin
    Plug 'plasticboy/vim-markdown'

    " markdown preview - requires yarn
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'

    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    Plug 'preservim/nerdcommenter'

    Plug 'kassio/neoterm'
    Plug 'sbdchd/neoformat'

    Plug 'morhetz/gruvbox'

    Plug 'tpope/vim-surround'

    " Plug 'easymotion/vim-easymotion'

    " Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate' }

    Plug 'will133/vim-dirdiff'
    call plug#end()
