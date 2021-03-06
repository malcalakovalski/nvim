" Set  options
" Set compatibility to Vim only.
set nocompatible

"Show line numbers
set number

" Set relative number by default 
set relativenumber
" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" Enable highlight search 
set hlsearch 
set incsearch 
" Quickly source .vimrc
nnoremap <leader>r :source $MYVIMRC<CR>
" Quickly open .vimrc in new tab
nnoremap <leader>v :tabedit ~/.config/vim-plug/plugins.vim<CR>
"For plug-ins to load correctly.
filetype plugin indent on

setlocal spell
set spelllang=en_us
"inroemap <C-l> <c-g>u<Esc>[siz=`]a<c-g>u
" Turn off modelines

set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
set textwidth=100
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
"Disable matching
let g:AutoPairs = ''
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100
" Mappings
" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
"
" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Plugins
call plug#begin('~/.config/nvim/autoload/plugged')
" Surround quotes
Plug 'tpope/vim-surround'
"Vim comments
Plug 'tpope/vim-commentary'
"Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Gruvbox is a retro color scheme for vim: https://github.com/morhetz/gruvbox
" Auto completion
"Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --clang-completer --rust-completer' }
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'junegunn/vim-easy-align'
"Linting
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
"Rainbow brackets
Plug 'frazrepo/vim-rainbow'
"Status bar
Plug 'itchyny/lightline.vim'
" Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/nerdtree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'jalvesaq/Nvim-R'
"NERDTree
"NERDTree is a popular plugin to display an interactive file tree view in a side panel, which can be useful when working in larger project.
"Plug 'preservim/nerdtree'
" Fuzzy file search tool
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'KeitaNakamura/tex-conceal.vim'
" various color schemes (neovim default is 'dark'; I like 'slate' with dark background)
" http://vimcolors.com/

" Check what these plugins do. Seem to be color related
Plug 'freeo/vim-kalisi'
Plug 'w0ng/vim-hybrid'
Plug 'dylanaraps/wal'
Plug 'bitterjug/vim-colors-bitterjug'
Plug 'jonathanfilip/vim-lucius'
Plug 'crusoexia/vim-monokai'
Plug 'jacoborus/tender.vim'
Plug 'pbrisbin/vim-colors-off'
Plug 'muellan/am-colors'
Plug 'blueshirts/darcula'
" A Vim Plugin for Lively Previewing Latex PDF Output
" DEOPLETE for autocompletion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Jedi autocompletion
Plug 'davidhalter/jedi-vim'
Plug '907th/vim-auto-save'
call plug#end()

" Global variables 
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
let conceallevel=1
let g:tex_conceal='abdmg'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:livepreview_previewer = 'open -a Preview'
" Setup the compile rule for pdf to use pdflatex with synctex enabled

" Auto commands
"autocmd Filetype tex setl updatetime=1
" Auto start NERD tree when opening a directory
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
"Auto start NERD tree if no files are specified
"autocmd StdinReadPre * let s:std_in=1

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
"autocmd VimEnter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" disable mesy latex indentations
autocmd FileType tex setlocal shiftwidth=0 

" -----------------------------------------------------------------------------
"  FZF  OPTIONS
"  ----------------------------------------------------------------------------
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Mappings
nmap <C-P> :FZF<CR>
" -----------------------------------------------------------------------------
"  VIMTEX OPTIONS
"  ----------------------------------------------------------------------------
let g:vimtex_view_general_viewer
        \ = "/Applications/Skim.app/Contents/SharedSupport/displayline -r " 
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
augroup vimtex_compilation
  au!
    au User VimtexEventCompileSuccess call UpdateSkim()
augroup END

function! UpdateSkim()
    let l:out = b:vimtex.out()
    let l:tex = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']
    if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
    endif
    if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
    elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
    else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
    endif
endfunction
let g:vimtex_compiler_progname = 'nvr'
" One of the neosnippet plugins will conceal symbols in LaTeX which is
" confusing
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
" Can hide specifc warning messages from the quickfix window
" Quickfix with Neovim is broken or something
" https://github.com/lervag/vimtex/issues/773
let g:vimtex_quickfix_latexlog = {
            \ 'default' : 1,
            \ 'fix_paths' : 0,
            \ 'general' : 1,
            \ 'references' : 1,
            \ 'overfull' : 1,
            \ 'underfull' : 1,
            \ 'font' : 1,
            \ 'packages' : {
            \   'default' : 1,
            \   'natbib' : 1,
            \   'biblatex' : 1,
            \   'babel' : 1,
            \   'hyperref' : 1,
            \   'scrreprt' : 1,
            \   'fixltx2e' : 1,
            \   'titlesec' : 1,
            \ },
            \}

" Customization of vimtex-latexmk compiler. See h: vimtex_compiler_latexmk
let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : 'build',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-xelatex',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
filetype plugin on
autocmd FileType tex set makeprg=rubber\ --inplace\ --maxerr\ 1\ \ --pdf\ --short\ --quiet\ --force\ %
autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>
autocmd FileType tex nmap <buffer> T :!open -a Skim %<.pdf %<.pdf<CR><CR>
autocmd FileType tex nmap <buffer> C :!rubber --clean<CR>
" -----------------------------------------------------------------------------
"  APPEARANCE
"  ----------------------------------------------------------------------------
" set guifont=Sauce\ Code\ Pro\ Medium\ Nerd\ Font\ Complete\ Mono\ 12
syntax on
set background=dark
let g:onedark_termcolors=16
" colorscheme flattened_darkt
" This is new style

let mapleader = "/"
autocmd FileType tex nmap <buffer> <C-T> :!xelatex %<CR>
autocmd FileType tex nmap <buffer> T :!open -a Skim %:r.pdf<CR><CR>
" Use deoplete.
let g:deoplete#enable_at_startup = 1
colorscheme gruvbox
set background=dark
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
hi Conceal ctermbg=none
" Mappings for incfigures

"Powerline
"
"Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"Function
fun! GoYCM()
    nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

fun! GoCoc()
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <buffer><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <buffer> <silent><expr> <c-space> coc#refresh()


    " GoTo code navigation 
    nmap <buffer> <leader>gd <Plug>(coc-definition)
    nmap <buffer> <leader>gy <Plug>(coc-type-definition)
    nmap <buffer> <leader>gi <Plug>(coc-implementation)
    nmap <buffer><Plug>gr <Plug>(coc-references)
    nnoremap <buffer> <leader>cr :CocRestart
endfun
" Change default target to pdf, if not dvi is used
let g:Tex_DefaultTargetFormat = 'pdf'
 
" Setup the compile rule for pdf to use pdflatex with synctex enabled
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*' 
 
" PDF display rule
let g:Tex_ViewRule_pdf = 'open -a Skim'
map /ls :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf<CR><CR>
map /lv <leader>lv

"Make j and k move to the next row, not the next line
nnoremap j gj
nnoremap k gk
" Home & End should be placed next to each other 
nnoremap - $
" Move to beggining/end of line
nnoremap B ^
nnoremap E $

" Quick save
nnoremap <S-s> :w<CR>
"autocmd BufWritePre * :call TrimWhitespace()
"autocmd FileType typescript :call GoYCM()
"autocmd FileType py :call GoCoc()
"
    let g:auto_save_events = ["InsertLeave", "TextChanged"]   
    autocmd FileType tex let g:auto_save = 1
    autocmd FileType tex let g:auto_save_silent = 1
