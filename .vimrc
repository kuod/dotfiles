" ─── Syntax ────────────────────────────────────────────────────────────────

syntax on

" ─── General editing ────────────────────────────────────────────────────────

set number
set scrolloff=5
set backspace=indent,eol,start

" ─── Search ─────────────────────────────────────────────────────────────────

set incsearch
set ignorecase
set smartcase
set hlsearch

" ─── Indentation ────────────────────────────────────────────────────────────

set expandtab
set tabstop=4
set shiftwidth=4

autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
autocmd FileType markdown setlocal tabstop=2 shiftwidth=2

" ─── Python ─────────────────────────────────────────────────────────────────

autocmd FileType python setlocal colorcolumn=88
