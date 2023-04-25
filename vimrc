" Plugins to install/update using Plug plugin
" To add new plugins just add them here and run :PlugInstall :PlugUpdate
" For configuration look into .vim/plugged
"

call plug#begin()

"Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'prabirshrestha/vim-lsp.git'
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'jremmen/vim-ripgrep'

call plug#end()

" HOW TO MAKE FZF WORK WITH GREP? MAYBE RIPGREP? - yes, install ripgrep to
" have rg binary
"let g:rg_binary = 'grep'
"let g:rg_command = 'grep'

" TODO: https://github.com/ThePrimeagen/init.lua/commit/33eee9ad0c035a92137d99dae06a2396be4c892e
"
" vim-fugitive for GIT integration


" For undotree plugin
nnoremap <F5> :UndotreeToggle<CR>


" Fuzzy Finders
" FZF is used primarly on VIM
" The Primeagen uses Telescope as its NeoVIM specific



" When scrolling up/down leave 8 lines of code visible when you're at the
" top/bottom of the screen
set scrolloff=8
" Set line numbers and relative line numbers  (later toggle them with F2)
" set num | nonum | rnum | rnu!
set number
set relativenumber

" How many spaces a <tab> creates
set tabstop=4 softtabstop=4
set shiftwidth=4
" replace tabs with spaces
set expandtab
" Enables automatic indentation
set smartindent

set hls ic
set incsearch


" Toggle between nonumber -> number -> relativenumber -> number -> nonumber
"nmap <silent> <F2> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" Toggle between nonumber -> number & relnum -> nonumber
nnoremap <F2> :set nonumber! rnu!<CR>

colorscheme desert

set colorcolumn=100
"This color has to go AFTER the colorscheme
highlight ColorColumn ctermbg=7

" Close NerdTree together with the last closed file
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Our remaps
" Set Leader as space
let mapleader = " "
" Set Leader_pv as the Vertical Explorer
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>ph :Hex<CR>

" fzf
":GFiles ->  
" Meaning: ctrl+p to start :GFiles - git explorer using FZF
" Meaning: leader+s to start :FZF - ALL Files explorer using FZF
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>s :FZF<CR>

" :FZF   - opens files not in git or other repos
" Similarly to [ctrlp.vim](https://github.com/kien/ctrlp.vim), use enter key,
" `CTRL-T`, `CTRL-X` or `CTRL-V` to open selected files in the current window,
" in new tabs, in horizontal splits, or in vertical splits respectively.




" :h quickfix
" you will need 3 commands: :copen :cnext :cprev
"
" Quickfix lists were very mysterious to me when I started with vim. I knew that there was a list of items and that it would pop up and if I left them I didn't know how to go back. Little did I know how useful they are, especially when navigating histories, such as git.
"
" I don't know if I love these remaps yet.  I am considering doing
" <leader>c(k|j|o)
nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz
nnoremap <Leader>k :lnext<CR>zz
nnoremap <Leader>j :lprev<CR>zz
nnoremap <C-E> :copen<CR>

" To increment numbers: create numbers, select in visual, g + ctrl+a to
" increment


" REGISTERS
" Delete a few more lines and re-inspect your register.  What you should observe,
" and can be found in `:h reg` is that your implicit register `"` is _always_ the 
" latest yank or delete.  It is also what is used when pasting.  We _knew_ this
" from our previous lesson, but now we observe why.
" 
" ### How do we interact with registers?
" We see how our actions are side effects to the state of the registers.  But 
" what if you wanted to paste or yank explicitly?  Good thing we have a clue.
" Notice that every register starts with `"`.  Lets `:h "`



" how to list all available options for VIM setting:
" :colorscheme <CTRL-d>
"
"
"
"
" How to open NetRW built-in file explorer?
" How to use netrw instead of NerdTree: https://blog.stevenocchipinti.com/2016/12/28/using-netrw-instead-of-nerdtree-for-vim/
" :Vex
" :Vex(plore)  - Vertical Explorer
"
" :Hex
" :Hex(plore)  - Horizontal Explorer
"
"
"
"
"
"
" How to Source current file???
"
" :so %
"
"
"
"
" How to use MARKS: https://theprimeagen.github.io/vim-fundamentals/files-marks
"
"
"
"
"



" THIS SECTION IS FOR VSNIP + FRIENDLY SNIPPETS : https://github.com/hrsh7th/vim-vsnip
"
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
let g:vsnip_filetypes.typescriptreact = ['typescript']"


" Buffers
"map <C-
" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>b :ls<CR>
nnoremap <Leader>h :bp<CR>
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>x :bd<CR>
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




vnoremap H :m '>+1<CR>gv=gv
vnoremap L :m '<-2<CR>gv=gv
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Requires vim-gtk3 because :echo has('clipboard') needs to return 1
" nmap <Leader>y "+y
noremap <Leader>y "+y
vnoremap <Leader>y "+y
nmap <Leader>Y "+Y

nnoremap <Leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
vnoremap <Leader>s :s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

nnoremap <Leader>x :silent !chmod +x %<CR>O<CR>


