execute pathogen#infect()
set nocompatible              " be iMproved, required
filetype off                  " required

" autocmd VimEnter * NERDTree

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'
Plug 'robu3/vimongous'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" ----- Svelte
" Plug 'burner/vim-svelte'

" Prettier Settings
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'master',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'typescriptreact', 
    \ 'javascriptreact',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }

packloadall

" tabnine stuff
" set rtp+=~/.vim/plugged/tabnine-vim

let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json PrettierAsync

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-J>"
let g:UltiSnipsJumpForwardTrigger="<c-z>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "react-redux-snips"]
" ----------------------------------

" Plug 'w0rp/ale'
" Plug 'skywind3000/asyncrun.vim'

call plug#end()

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_javascript_prettier_options = '--single-quote all'
let g:ale_fixers = {
            \  'javascript': ['prettier'],
            \  'typescript': ['prettier'],
            \}
let g:ale_fix_on_save = 1

" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

set t_ut=
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set smarttab

set number
let g:formatterpath = ['/usr/local/lib/node_modules/js-beautify/']
let mapleader=","
set timeout timeoutlen=1500

" no swap file
set noswapfile

" vim slime for running fsharpi see https://github.com/jpalardy/vim-slime
let g:slime_target = "tmux"

noremap <F7> :Autoformat<CR><CR>
nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <silent> <C-E> :TagbarToggle<CR>
let g:NERDTreeDirArrows=0
nmap ,n :NERDTreeFind<CR>
let NERDTreeShowHidden=0

" ctrlp stuff
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }


imap jk <Esc>

" Now we can turn our filetype functionality back on
filetype plugin indent on
"set clipboard=unnamed

" React formatter
let g:jsx_ext_required = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

syntax enable
set background=dark

""" Customize colors
func! s:my_colors_setup() abort
    " this is an example
    hi Pmenu guibg=#ffffff gui=NONE
    hi PmenuSel guibg=#b7c7b7 gui=NONE
    hi PmenuSbar guibg=#bcbcbc
    hi PmenuThumb guibg=#585858
    hi Pmenu ctermbg=245 ctermfg=254
endfunc

augroup colorscheme_coc_setup | au!
    au ColorScheme * call s:my_colors_setup()
augroup END

colorscheme twilight

" ack vim stuff
let g:ackprg = 'ag --vimgrep --nogroup --nocolor --column'

" window management
function! WinMove(key) 
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else 
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
 
map <leader>h              :call WinMove('h')<cr>
map <leader>k              :call WinMove('k')<cr>
map <leader>l              :call WinMove('l')<cr>
map <leader>j              :call WinMove('j')<cr>
map <leader>wc :wincmd q<cr>

map <leader>wr <C-W>r

map <leader>H              :wincmd H<cr>
map <leader>K              :wincmd K<cr>
map <leader>L              :wincmd L<cr>
map <leader>J              :wincmd J<cr>

nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>

"Show hidden files and folders
let NERDTreeShowHidden=1

" map <leader>. :CtrlPTag<cr>

"Quick quit
nmap <leader>qq  :wqa!<cr>
nmap <leader>ww  :Prettier<cr>:w<cr>
" nmap <leader>ww  :w!<cr>
nmap <leader>w  :w<cr>

"Tern
"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'
let g:tern_show_signature_in_pum=1
let g:tern_show_loc_after_rename=0
nmap <leader>rr :TernRename<cr>
nmap <leader>rf :TernRefs<cr>
nmap <leader>td :TernDef<cr>

"FZF
set rtp+=/usr/local/opt/fzf
nmap <leader>f :FZF<cr>

"Moving stuff
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
xnoremap <C-j> :m '>+1<CR>gv=gv
xnoremap <C-k> :m '<-2<CR>gv=gv


set diffopt=filler,context:0

"completer
let g:completor_node_binary = '/Users/davidwong/.nvm/versions/node/v10.8.0/bin/node'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

"nerd tree quit when open file
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" search and replace
:nnoremap <leader>s :Ack!<Space>
:nnoremap <leader>ss :Ack!<Space><C-r><C-w>
" :nnoremap <Leader>r :%s/<C-r><C-w>//g<Left><Left>

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" set the clipboard to the system clipboard
set clipboard=unnamed

"edit vimrc in split
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" "YouComplete Me 
" nnoremap <silent> <leader>gt <CR>

"abbreviations
:iabbrev cl console.log()

" edit in next and last parentheses
:onoremap in( :<c-u>normal! f(vi(<cr>
:onoremap il( :<c-u>normal! F)vi(<cr>

" Status Line---------------------- {{{
set statusline=%f " Path to the file
set statusline+=%= " Switch to the right side
set statusline+=%l " Current line
set statusline+=/ " Separator
set statusline+=%L " Total lines
set statusline+=- " Separator
set statusline+=%c " Separator
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker 
augroup END
" }}}


" Typescript
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

" let g:db_ui_env_variable_url = 'mongo://mongo-db:27017'
" let g:db_ui_env_variable_name = 'jarvis'
let g:dbs = {
\  'dev': 'mongodb://mongo-db:27017/jarvis'
\ }



" Coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"import missing library
nmap <leader>do <Plug>(coc-codeaction)  
nmap <leader>rn <Plug>(coc-rename)

" show definition
nnoremap <silent> K :call CocAction('doHover')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
