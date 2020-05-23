if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
    Plug 'kovetskiy/sxhkd-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'arcticicestudio/nord-vim'
    Plug 'nelstrom/vim-visual-star-search'
    Plug 'Lenovsky/nuake'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
call plug#end()

let g:lightline = {
      \ 'colorscheme': 'wombat', }

" Basic Mappings
let mapleader =" "
map Q <Nop>
map QQ :q<cr>
nmap WQ ZZ
nmap WW :w<cr>
nmap Q! ZQ
noremap <Del> "_x
inoremap <C-Del> <C-o>"_de
nnoremap <C-Del> "_de
nmap <C-h> a<C-W><esc>

" copy/paste
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>Y "*y
noremap <Leader>P "*p

" buffers / tabs
noremap <C-T> :tabnew<cr>
nmap <tab> :tabNext<cr>
nmap <leader><tab> :Buffers<cr>

" fzf open file
noremap <leader>f :Files<cr>

" select all lines
map <C-a> <esc>ggVG<CR>

" toggle line numbers
noremap <F3> :set nu!<CR>
inoremap <F3> <C-O>:set nu!<CR>

" distraction free mode
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
map <F8> :Goyo<CR>

" sudo write file
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" faster replace all
nnoremap <leader>r :%s///g<Left><Left><Left>

" toggle spellcheck
map <F7> :setlocal spell! spelllang=en_us<CR>

" popup terminal
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>

" Open .pdf/.html
map <leader>p :!opout <c-r>%<CR><CR>

" splits
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l
" quick splits
map <leader>sv  :vs<cr>
map <leader>sh  :sp<cr>

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" reload sxhkd automatically
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" vifmrc syntax
autocmd BufNewFile,BufRead vifmrc :set filetype=vifm
autocmd BufNewFile,BufRead ~/.vifm/colors/* :set filetype=vifm

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" deletes trailing whitespace and newlines at end of file on save
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" nerd tree
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeQuitOnOpen=0
" Open nerd tree at the current file or close nerd tree if pressed again.
nmap <leader>t :NERDTreeToggle

syntax on
colorscheme nord
filetype plugin on
set wildmode=longest,list,full
set noshowmode
set tabstop=4
set nostartofline
set shiftwidth=4
set expandtab
set nocompatible
set number
set numberwidth=1
set encoding=utf-8
set completeopt-=preview
set go=a
set mouse=a
set ignorecase
set smartcase
set cursorline
set t_Co=256
set clipboard=unnamedplus
set splitbelow splitright
set shortmess=IFA
"set termguicolors
set nohlsearch

let g:limelight_conceal_ctermfg = '8'
let g:nord_cursor_line_number_background = 1
hi clear CursorLine
hi clear CursorLineNR
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END
