set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set foldmethod=indent
set foldlevel=99
set nonumber

highlight clear SignColumn

set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Terminal mode mappings for moving around and exiting terminal mode
tnoremap \\ <C-\><C-n>
"tnoremap <Esc><Esc> <C-\><C-n>



set shell=/bin/zsh

autocmd TermOpen term://* startinsert " Insert mode when opening terminal
"autocmd TermClose term://* :q!

autocmd BufWinEnter,WinEnter term://* startinsert


tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <A-w>h <C-w>v
nnoremap <A-w>l <C-w>v <C-\><C-N><C-w><Right>
nnoremap <A-w>k <C-w>s
nnoremap <A-w>j <C-w>s <C-\><C-N><C-w><Down>

tnoremap <A-w>h <C-\><C-N><C-w>v  <C-\><C-N>:enew<CR>
tnoremap <A-w>l <C-\><C-N><C-w>v <C-\><C-N> <C-w><Right> <C-\><C-N>:enew<CR>
tnoremap <A-w>k <C-\><C-N><C-w>s <C-\><C-N>:enew<CR>
tnoremap <A-w>j <C-\><C-N><C-w>s <C-\><C-N><C-w><Down> <C-\><C-N>:enew<CR>

nnoremap <A-t>h <C-w>v:terminal<CR>
nnoremap <A-t>l <C-w>v<C-w><Right>:terminal<CR>
nnoremap <A-t>k <C-w>s:terminal<CR>
nnoremap <A-t>j <C-w>s<C-w><Down>:terminal<CR>

" escape with jk
inoremap ;' <esc>
"vnoremap jk <esc>
"inoremap <S-CR> <Esc>

nnoremap <Space> :

nnoremap \\ :q<CR>
nnoremap \! :q!<CR>

set mouse=a

call plug#begin('~/.vim/plugged')

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'vim-airline/vim-airline'

let g:coc_global_extensions = ['coc-json', 'coc-pyright']
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-sleuth'

Plug 'godlygeek/tabular'

call plug#end()

runtime coc.vim

