" disable header folding
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" allow code insert for languages below
let g:markdown_fenced_languages = [
            \ 'bash=sh', 'javascript', 
            \ 'js=javascript', 'json=javascript', 
            \ 'typescript', 'ts=typescript', 
            \ 'php', 
            \ 'c', 'c++',
            \ 'python',
            \ 'html', 'css']

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" This vim-markdown plugin also provides a few shortcuts and commands:
"
"    Shortcut:
"        ]]: go to next header
"        [[: go to previous header
"    Command
"        Toc: create a vertical window of table of contents
"        TableFormat: format the table under current cursor
