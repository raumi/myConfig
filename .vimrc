set number

" show current mode at the bottom
set showmode

" turn on syntax highlighting
syntax on

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" highlight search results
set hlsearch

" use spaces instead of tabs
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" suggest to stop writing after 80 chars per line
set colorcolumn=100

syntax enable
set background=dark
