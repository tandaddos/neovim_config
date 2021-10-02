let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'c': '~/.config/i3/config' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/.config/nvim',
            \ '~/devel/exps/projects/',
            \ '~/devel/exps/projects/cpp',
            \ '~/devel/exps/projects/java',
            \ '~/devel/exps/projects/misc',
            \ '~/Pictures',
            \ ]

" let startify take care of buffers
let g:startify_session_delete_buffers = 1

" similar to vim-rooter - always start at dir containing .git dir
let g:startify_change_to_vcs_root = 1

" use unicode
let g:startify_fortune_use_unicode = 1

" auto update sessions
let g:startify_session_persistence = 1

" get rid of empty buffers on quit
let g:startify_enable_special = 0

let g:startify_custom_header = [
        \'                            _            ',
        \'     ____  ___  ____ _   __(_)___ ___    ', 
        \'    / __ \/ _ \/ __ \ | / / / __ `__ \   ',
        \'   / / / /  __/ /_/ / |/ / / / / / / /   ',
        \'  /_/ /_/\___/\____/|___/_/_/ /_/ /_/    ',
        \]


