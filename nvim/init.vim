set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'jparise/vim-graphql'
Plug 'ap/vim-css-color'
Plug 'w0rp/ale'
Plug 'dart-lang/dart-vim-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ervandew/supertab'
Plug 'keith/swift.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rhysd/git-messenger.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Neevash/awesome-flutter-snippets'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'exitface/synthwave.vim'

" skyn
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim'

call plug#end()

" Search highlight and searching as you type
set hlsearch
set incsearch

" JSX enabled for js files
let g:jsx_ext_required = 0

" Theme codedark
set background=dark
color synthwave
syntax enable
set t_Co=256
colorscheme dracula
set background=dark


let g:airline_theme='synthwave'

if has('termguicolors')
  set termguicolors " 24-bit terminal
else
  let g:synthwave_termcolors=256 " 256 color mode
endif

set encoding=utf8
let g:WebDevIconsOS = 'Darwin'

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

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

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


" Adjusting tab order
let g:SuperTabDefaultCompletionType = "<c-n>"

" map gf to open on a slit
nnoremap fg <C-W>f

" Terminal
tnoremap <Esc> <C-\><C-n>
command Term below new term://bash
command VTerm vsplit term://bash

" Relative number
set relativenumber

" keymap for vim lsc
let g:lsc_auto_map = v:true

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" CODE SNIPPET
" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']


