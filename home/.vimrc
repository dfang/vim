" vim: foldmethod=marker

" {{{  
" see docs on https://github.com/dfang/vim
" remember to mkdir -p ~/.vim/{plugged,backups,swap,tmp} to avoid errors

set nocompatible
syntax on
filetype plugin indent on

" Automatically install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}


" {{{  Plugins
call plug#begin('~/.vim/plugged')
    let g:has_async = v:version >= 800 || has('nvim')
    Plug 'tpope/vim-sensible'     " sensible default
    Plug 'tpope/vim-sleuth'       " no need to set buffer options like tabstop,shiftwidth,expandtab,etc
    Plug 'tpope/vim-surround'

    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/vim-easy-align'
    Plug 'mileszs/ack.vim'
    Plug 'pbrisbin/vim-mkdir'


    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'      " GBrowse handler
    Plug 'airblade/vim-gitgutter' " shows git diff markers in the sign column

  
    Plug 'editorconfig/editorconfig-vim'
    Plug 'skywind3000/asyncrun.vim'
    " Plug 'mhinz/vim-startify'
    " Plug 'Xuyuanp/nerdtree-git-plugin'    " showing git status in NERDTree

    Plug 'jremmen/vim-ripgrep'
    " If fzf has already been installed via Homebrew, use the existing fzf
    " Otherwise, install fzf. The `--all` flag makes fzf accessible outside of vim
    if isdirectory("/usr/local/opt/fzf")
      Plug '/usr/local/opt/fzf'
    else
      Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    endif
    Plug 'junegunn/fzf.vim'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'mattn/emmet-vim'
    Plug 'sheerun/vim-polyglot'
    " Plug 'stephpy/vim-yaml'
    " Plug 'ekalinin/Dockerfile.vim'
    " Plug 'vim-scripts/nginx.vim'
    " Plug 'elixir-editors/vim-elixir'
    " Plug 'slashmili/alchemist.vim'
    " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " Plug 'othree/html5.vim'
    " Plug 'ekalinin/Dockerfile.vim'
    " Plug 'vim-scripts/nginx.vim'
    Plug 'Yggdroot/indentLine'              " display the indention levels with thin vertical lines

    if g:has_async
      Plug 'dense-analysis/ale'
    endif
call plug#end()
" }}}

let mapleader = ","

" {{{ Basic Settings
set mouse=a                          " Enable mouse in all modes
set clipboard=unnamed                " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set ttyfast                          " Optimize for fast terminal connections
set number relativenumber
set hlsearch ignorecase incsearch
set tabstop=2
set nolist
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Show invisible characters
set showmode showcmd wildmenu        " Enhance command-line completion
set backspace=indent,eol,start       " Allow backspace in insert mode
set encoding=utf-8 nobomb            " Use UTF-8 without BOM
set modeline                         " Respect modeline
hi Folded ctermbg=242                " Make folded looks better on my chosen themes


" Centralize backups, swapfiles and undo history
set backup
set backupdir=~/.vim/backups
set directory=~/.vim/swap

" Quicker window movement
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" }}}


" {{{ Configuration for Airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
function! Randnum(max) abort
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % a:max
endfunction
let g:airline_themes_list = ['simple', 'cool', 'dark', 'term', 'google_dark', 'violet', 'understated', 'violet', 'jellybeans', 'jet']
let g:randomn = Randnum(len(g:airline_themes_list))
let g:airline_theme = g:airline_themes_list[g:randomn]
" }}}


" {{{ Configuration for NERDTree
let loaded_netrwPlugin = 1
let NERDTreeShowHidden   = 1   " I to toggle
let g:NERDTreeQuitOnOpen = 1
map <Leader>d :NERDTreeToggle<CR>
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" }}}


" {{{ Configuration for FZF
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
let g:fzf_layout = { 'window': 'let g:launching_fzf = 1 | keepalt topleft 100split enew' }
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
" }}}


" {{{ Configuration for IndentLine
let g:indentLine_enabled = 0
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_char = '⦙'
" }}}


" {{{  Configuration for EasyAlign  ga -> CTRL+X -> special delimiter key
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign) 
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)   
" }}}


" {{{  Helper functions
" ZenModeToggle
if !exists("*Zen")
  function! Zen()
    set norelativenumber! nonumber! nohlsearch! nolist
    echom "ZenModeToggle"
  endfunction
  command! ZenModeToggle call Zen()
endif

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
  echom "removed trailing whitespace !!!"
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Reload $MYVIMRC
if !exists("*ReloadConfigs")
  function ReloadConfigs()
      :source $MYVIMRC
      echom ".vimrc reloaded !!!"
  endfunction
  command! Reload call ReloadConfigs()
endif
" }}}


" {{{ Automatic commands
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

if has("autocmd")
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:> foldmethod=indent nofoldenable
endif
" }}}

" Local custom config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
