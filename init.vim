source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/paths.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

" Themes
source $HOME/.config/nvim/themes/onedark.vim

" startify
source $HOME/.config/nvim/plug-config/start-screen.vim

" ranger
source $HOME/.config/nvim/plug-config/rnvimr.vim

" fzf and vim-rooter
source $HOME/.config/nvim/plug-config/fzf.vim

" airline status - use https://github.com/powerline/fonts.git --depth=1 if desired
source $HOME/.config/nvim/themes/airline.vim

" colorizer
luafile $HOME/.config/nvim/lua/plug-colorizer.lua

" which key
source $HOME/.config/nvim/keys/which-key.vim

" native lsp
source $HOME/.config/nvim/plug-config/lsp-config.vim
luafile $HOME/.config/nvim/lua/compe-config.lua
luafile $HOME/.config/nvim/lua/python-lsp.lua
luafile $HOME/.config/nvim/lua/bash-lsp.lua
luafile $HOME/.config/nvim/lua/rust-lsp.lua
luafile $HOME/.config/nvim/lua/clangd-lsp.lua
luafile $HOME/.config/nvim/lua/tsserver-lsp.lua
luafile $HOME/.config/nvim/lua/go-lsp.lua

" markdown
source $HOME/.config/nvim/plug-config/vim_markdown.vim
source $HOME/.config/nvim/plug-config/goyo_limelight.vim
source $HOME/.config/nvim/plug-config/markdown_preview.vim
source $HOME/.config/nvim/plug-config/vim_pandoc_syntax.vim

" commenter
source $HOME/.config/nvim/plug-config/nerdcommenter.vim

" NERDTree
source $HOME/.config/nvim/plug-config/nerdtree_config.vim

" neoterminal
source $HOME/.config/nvim/plug-config/neoterm.vim

" neoformatter
source $HOME/.config/nvim/plug-config/neoformat.vim

" gruvbox theme
source $HOME/.config/nvim/themes/gruvbox.vim

" nvim-treesitter
" luafile $HOME/.config/nvim/lua/nvim-treesitter.lua
