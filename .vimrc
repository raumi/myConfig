set number

" show current mode at the bottom
set showmode

" turn on syntax highlighting
syntax on

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Switch window mappings to use left ALT key plus direction arrows to move between windows /*{{{*/
nnoremap <A-Up> :normal <c-r>=SwitchWindow('+')<CR><CR>
nnoremap <A-Down> :normal <c-r>=SwitchWindow('-')<CR><CR>
nnoremap <A-Left> :normal <c-r>=SwitchWindow('<')<CR><CR>
nnoremap <A-Right> :normal <c-r>=SwitchWindow('>')<CR><CR>

function! SwitchWindow(dir)
  let this = winnr()
    if '+' == a:dir
      execute "normal \<c-w>k"
    elseif '-' == a:dir
      execute "normal \<c-w>j"
    elseif '>' == a:dir
      execute "normal \<c-w>l"
    elseif '<' == a:dir
      execute "normal \<c-w>h"
    else
      echo "Oops. check your ~/.vimrc"
      return ""
  endif
endfunction
" /*}}}*/

" allow all window commands in insert mode
:imap <C-w> <C-o><C-w>

" highlight search results
set hlsearch

" use spaces instead of tabs
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" suggest to stop writing after num chars per line
set colorcolumn=100

syntax enable
set background=dark
