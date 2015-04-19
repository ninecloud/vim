set encoding=utf8
set fileformats=unix,dos,mac

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
nmap 0 ^

set cindent
set smartindent
set number
set ic
set hlsearch
set path=.,/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/usr/include/
"set tags=./tags,../tags,../../tags,../../../tags,../../../../tags

syntax on

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd FileType php noremap <C-L> :!clear;php -ln %<CR>

if version >= 603
    set helplang=cn
endif

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2
set cmdheight=2

set cscopequickfix=s-,c-,d-,i-,t-,e-
cs add cscope.out

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

call pathogen#infect()  
syntax on
filetype plugin indent on

" Use <leader>t to open ctrlp
" let g:ctrlp_map = '<leader>t'
let g:ctrlp_map = '<c-p>'
" Ignore these directories
set wildignore+=*/build/**
" disable caching
let g:ctrlp_use_caching=0

nmap <leader>d :NERDTreeToggle<CR>

let g:SuperTabDefaultCompletionType = 'context'

let g:acp_behaviorJavaEclimLength = 3
function MeetsForJavaEclim(context)
    return g:acp_behaviorJavaEclimLength >= 0 &&
                \ a:context =~ '\k\.\k\{' . g:acp_behaviorJavaEclimLength . ',}$'
endfunction
let g:acp_behavior = {
    \ 'java': [{
    \ 'command': "\<c-x>\<c-u>",
    \ 'completefunc' : 'eclim#java#complete#CodeComplete',
    \ 'meets'        : 'MeetsForJavaEclim',
    \ }]
\ }
