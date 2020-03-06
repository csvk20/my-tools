" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\ | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set colorcolumn=79
set nu		      	" Show line number
set incsearch		  " Incremental search
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set hidden        " Hide buffer while switching to enable undo
"set autowrite		" Automatically save before commands like :next and :make
"set mouse=a		  " Enable mouse usage (all modes)

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" added nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'altercation/vim-colors-solarized'
Plugin 'w0rp/ale'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'qpkorr/vim-bufkill'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"------------- Nerd Tree shortcut -------------
map <C-n> :NERDTreeToggle<CR>
map <M-PageDown> :bn<CR>
map <M-PageUp> :bp<CR>
map <C-c> :BD<CR>
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l
nnoremap <C-Up> <C-w>k
nnoremap <C-Down> <C-w>j

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" Start Nerd tree by typing vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

call NERDTreeHighlightFile('jade', 'DarkGreen', 'none', 'green', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ini', 'LightGreen', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('styl', 'DarkCyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('yml', 'LightGreen', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'DarkGreen', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('vim', 'DarkGreen', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'DarkGreen', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'DarkGreen', 'none', 'green', '#151515')
call NERDTreeHighlightFile('html', 'DarkMagenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('css', 'LightBlue', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('md', 'DarkCyan', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('ts', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('sh', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('py', 'DarkYellow', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('txt', 'Magenta', 'none', '#ff00ff', '#151515')

"-----Added for Highlighting spelling mistakes in comments-----
autocmd BufRead,BufNewFile *.py setlocal spell
set spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

"----------Added for highlighting extra spaces--------------
let c_space_errors = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"------ Key Remapping ------
map <C-j> :%!python -m json.tool<CR>

"--------- For CPP Folding -----------
autocmd BufRead,BufNewFile *.cpp,*.h,*.cs setlocal foldmethod=syntax
autocmd BufRead,BufNewFile *.cpp,*.h,*.cs setlocal foldlevelstart=1
autocmd BufRead,BufNewFile *.cpp,*.h,*.cs setlocal colorcolumn=90
autocmd BufRead,BufNewFile *.cpp,*.h,*.cs setlocal cindent
"autocmd BufRead,BufNewFile *.cpp setlocal foldnestmax=2
"set foldmethod=syntax
"set foldlevelstart=1
set foldnestmax=2

"------- Shortcut for folding and unfolding ----------
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"--------------Added for Color scheme----------------
let g:solarized_termcolors=16 | 256
let g:solarized_termtrans=0 | 1
let g:solarized_degrade=0 | 1
let g:solarized_bold=1 | 0
let g:solarized_underline=1 | 0
let g:solarized_italic=1 | 0
let g:solarized_contrast="high" | "high" or "low"
let g:solarized_visibility="normal" | "high" or "low"

"---For Italic fonts-----
set t_ZH=[3m
set t_ZR=[23m

syntax enable
set background=dark
colorscheme solarized
highlight ColorColumn ctermbg=cyan

"---------------- For Copying to Clipboard directly ------------
set clipboard=unnamedplus

"------ Vim Tmux Mapping ------
let g:tmux_navigator_no_mappings = 1

"-------------For Ctrl P------------
set wildignore+=*/media/*,*/__pycache__/*,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.py.orig     " MacOSX/Linux
"map <C-p> :CtrlPTag<CR>
let g:ctrlp_extensions = ['tag']
let g:ctrlp_cmd = 'call CallCtrlP()'

func! CallCtrlP()
    if exists('s:called_ctrlp')
        CtrlPLastMode
    else
        let s:called_ctrlp = 1
        CtrlPMRU
    endif
endfunc

let g:ctrlp_custom_ignore = 'data\|build\|results'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"--------- Airline settings ------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" airline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'

"--------- Ale - Highlight errors in Airline -----------
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}
let g:ale_sign_error = '❌ '
let g:ale_sign_warning = '⭕ '
let g:ale_sign_column_always = 1

"------ Shortcut for nerd commenter -----
" In vim underscore will be registered as slash
map <C-_> <Leader>c<Space>

"------ Jedi-Vim Settings --------
autocmd FileType python setlocal completeopt-=preview

"------ Enable backspace in INSERT mode -------
set backspace=indent,eol,start
