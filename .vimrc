""" Automatically create needed files and folders on first run (*nix only) {{{
    call system('mkdir -p $HOME/.vim/{autoload,bundle,swap,undo}')
    if !filereadable($HOME.'/.vimrc.plugins') | call system('touch $HOME/.vimrc.plugins') | endif
    
""" }}}

""" vim-plug plugin manager {{{
    " Automatic installation
    " https://github.com/junegunn/vim-plug/wiki/faq#automatic-installation
    if empty(glob('~/.vim/autoload/plug.vim'))
        let g:clone_details = 'https://github.com/junegunn/vim-plug.git $HOME/.vim/bundle/vim-plug'
        silent call system('git clone --depth 1 '. g:clone_details)
        if v:shell_error | silent call system('git clone ' . g:clone_details) | endif
        silent !ln -s $HOME/.vim/bundle/vim-plug/plug.vim $HOME/.vim/autoload/plug.vim
        augroup FirstPlugInstall
            autocmd! VimEnter * PlugInstall --sync | source $MYVIMRC
        augroup END
    endif

    """ Plugins to be disabled {{{
    """ https://github.com/timss/vimconf/issues/13
        " Create empty list with names of disabled plugins if not defined
        let g:plugs_disabled = get(g:, 'plug_disabled', [])

        " Trim and extract repo name
        " Same substitute/fnamemodify args as vim-plug itself
        " https://github.com/junegunn/vim-plug/issues/469#issuecomment-226965736
        function! s:plugs_disable(repo)
            let l:repo = substitute(a:repo, '[\/]\+$', '', '')
            let l:name = fnamemodify(l:repo, ':t:s?\.git$??')
            call add(g:plugs_disabled, l:name)
        endfunction

        " Append to list of repo names to be disabled just like they're added
        " UnPlug 'junegunn/vim-plug'
        command! -nargs=1 -bar UnPlug call s:plugs_disable(<args>)
        
    """ }}}

    " Default to same plugin directory as vundle etc
    call plug#begin('~/.vim/bundle')
    
    " Autocompletion
    Plug 'zxqfl/tabnine-vim'
    
    " Configuration status bar statusline vim
    Plug 'itchyny/lightline.vim'
    
    " Snippets like textmate
    if has('python') || has('python3')
        Plug 'honza/vim-snippets'
        Plug 'sirver/ultisnips'
    endif
    
    " Local plugins
    if filereadable($HOME.'/.vimrc.plugins')
        source $HOME/.vimrc.plugins
    endif

    " Remove disabled plugins from installation/initialization
    " https://vi.stackexchange.com/q/13471/5070
    call filter(g:plugs, 'index(g:plugs_disabled, v:key) == -1')

    " Initalize plugin system
    call plug#end()
    
""" }}}

""" Base settings {{{
    set title                    " window title
    set number                   " line numbers
    set vb t_vb=                 " disable beep and flashing
    set autoindent               " indent when moving to the next line while writing code
    set showmatch                " show the matching part of the pair for [], {} and ()
    set nocompatible             " disable classic Vi compatibility mode
    set wrap                     " (no) wrap - dynamic (not) wrap of long lines
    set mouse=a                  " includes mouse support when working in the terminal (no GUI)
    set mousehide                " hide mouse in text input mode
    set mps+=<:>                 " show matching brackets for HTML-tags
    set noruler                  " disable ruler
    set history=1024             " store more command history
    set laststatus=2             " always show statusline vim
    
    set foldmethod=indent        " define blocks based on indentation
    set foldlevel=99             " nesting level
    nnoremap <space> za          " collapse the code with a combination on the keyboard SPACE
    
    let python_highlight_all = 1    " enable all Python syntax highlighting featurs
    let g:lightline = { 'colorscheme': 'powerline', }    " statusline vim
    
    """ Return to last edit position when opening files {{{
        augroup LastPosition
            autocmd! BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     exe "normal! g`\"" |
                \ endif
        augroup END
        
    """ }}}
    
""" }}}
