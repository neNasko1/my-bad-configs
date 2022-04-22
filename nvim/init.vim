set autoindent
set tabstop=4
set shiftwidth=4
set relativenumber
set number

syntax on
set clipboard=unnamedplus
if has('mouse')
    set mouse=a
endif

autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWritePre * :%s/\s\+$//e
highlight TrailingWhitespaces ctermbg=red
match TrailingWhitespaces /\s\s*$/

call plug#begin()
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    "Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

    Plug 'airblade/vim-gitgutter'

    Plug 'jacoborus/tender.vim'
call plug#end()

"" Tender theme start
if (has("termguicolors"))
 set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syntax enable
colorscheme tender
"" Tender theme end

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('num_processes', 4)
call deoplete#custom#option('max_list', 20)
call deoplete#custom#var('tabnine', {
\ 'line_limit': 1000,
\ 'max_num_results': 5,
\ })

nnoremap <C-t> :NERDTreeToggle<CR>
autocmd BufNewFile *.cpp 0r ~/.config/nvim/skeletons/skeleton.cpp
