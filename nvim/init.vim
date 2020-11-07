set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged')

Plug 'quabug/vim-gdscript'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/ctrlp.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'ekalinin/Dockerfile.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'mxw/vim-jsx'
Plug 'flowtype/vim-flow'
Plug 'w0rp/ale'
Plug 'moll/vim-node'
Plug 'posva/vim-vue'
Plug 'dart-lang/dart-vim-plugin'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'ervandew/supertab'
Plug 'keith/swift.vim'
Plug 'kamykn/skyhawk'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

" Search highlight and searching as you type
set hlsearch
set incsearch

" JSX enabled for js files
let g:jsx_ext_required = 0

" Theme
syntax enable
set t_Co=256
colorscheme skyhawk
set background=dark

set encoding=utf8

set expandtab
set tabstop=2
set ruler
set nu
set statusline+=%F
set laststatus=2
set autoread
set mouse=a
set autoindent
set cursorline
set pastetoggle=<F2>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

let g:lightline = { 'colorscheme': 'wombat' }

filetype plugin indent on


autocmd FileType gdscript setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType make setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType sh setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType html setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType ejs setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType erb setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType typescript setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType java setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType css setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType scss setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType javascript setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType js setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType json setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType coffee setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType lua setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType graphql setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType dart setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType swift setlocal expandtab tabstop=4 shiftwidth=4

" gradle as groovy
au BufNewFile,BufRead *.gradle setf groovy

" Window moving
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Resize control
nmap <left> :vertical resize -5<CR>
nmap <up> :resize -5<CR>
nmap <down> :resize +5<CR>
nmap <right> :vertical resize +5<CR>

" Copy/Paste
vmap <C-c> "+y
nmap <C-b> "+p

" NERDTree
" Autoopen
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open shortcut
map <C-n> :NERDTreeToggle<CR>

" erb files bugs
au BufNewFile,BufRead *.html.erb set filetype=html
au BufNewFile,BufRead *.js.erb set filetype=javascript

" lua views files
au BufNewFile,BufRead *.etlua set filetype=html

" Reset the listchars
set listchars=""
" a tab should display as " ", trailing whitespace as "."
set listchars=tab:\ \
" show trailing spaces as dots
set listchars+=trail:.
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

" ctrlp ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|class|war)$'
  \ }
" Follow symbolic links
let g:ctrlp_follow_symlinks = 1

" So react auto reload works ¯\_(ツ)_/¯
:set backupcopy=yes

" only enable flow if .flowconfig exists
if filereadable(".flowconfig")
  let g:flow#enable = 1
else
  let g:flow#enable = 0
endif

" ctrlp ignore
set wildignore+=node_modules

" Trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Vertical and Horizontal
command Horizontal windo wincmd K
command Vertical windo wincmd H

" ALE config
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" Vue vim disabling pre processors as it really slows down vim
let g:vue_disable_pre_processors=1

" Indent
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Deoplete
let g:deoplete#enable_at_startup = 1

" Using relative path for paths autocomplete
let g:deoplete#file#enable_buffer_path = 1

" Adjusting Deoplete tab order
let g:SuperTabDefaultCompletionType = "<c-n>"

" Disable deoplete for certain files
autocmd FileType dart
       \ call deoplete#custom#buffer_option('auto_complete', v:false)

" map gf to open on a slit
nnoremap fg <C-W>f

" Terminal
tnoremap <Esc> <C-\><C-n>
command Term below new term://bash
command VTerm vsplit term://bash

" Relative number
set relativenumber

" |Theme
set background=dark
colorscheme palenight

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif<Paste>
