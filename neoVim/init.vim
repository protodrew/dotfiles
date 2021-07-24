set nocompatible

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echo "installing vim-plug"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Automatically install missing plugins
function! InstallPlugins()
  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    PlugInstall
  endif
endfunction

augroup installplugins
  autocmd!
  autocmd VimEnter * call InstallPlugins()
augroup END

call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'arcticicestudio/nord-vim'
Plug 'habamax/vim-godot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': 'FZF' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'

call plug#end()

nmap k gk

set clipboard=unnamedplus

map <C-o> :NERDTreeToggle<CR>

"clear search by pressing <esc>
nnoremap <silent> <esc> :noh<return><esc>

" split right and below instead of left and up
set splitbelow
set splitright

set noswapfile
set number
set mouse=a

if (has("termguicolors"))
  set termguicolors
endif

set hidden

" use different indents in different filetypes
filetype plugin indent on

" tab characters are 2 wide
set tabstop=2

" when indenting with <>= use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab

" use syntax detection/highlighting
syntax enable


augroup vimrc
  au!
  au BufWritePost vimrc,.vimrc source $MYVIMRC | call InstallPlugins()
augroup END

colorscheme nord
" vim-latex-live-preview
let g:livepreview_previewer = 'zathura'

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
