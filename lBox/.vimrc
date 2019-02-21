" Powerline
" ~/.local
set rtp+=/root/.local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" Replacing the Tab for Spaces
set expandtab
set tabstop=2

" Syntax highlighting
:syntax on

" Include line numbering
set number

" Syntax search /name_search key n
set hlsearch
set incsearch

" Auto install Plugins if not found
" GIT Plug https://github.com/junegunn/vim-plug
" Take out a config :source ~/.vimrc | :PlugInstall
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
           \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    augroup PLUG
        au!
        autocmd VimEnter * PlugInstall
    augroup END
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plugin Auto insert or delete brackets, quotes in pair
" GIT Plugin https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'
" Plugin git (gutter) code markers + or -
" GIT Plugin https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'
call plug#end()

" Mappings Keys
map <C-n> :NERDTreeToggle<CR>
