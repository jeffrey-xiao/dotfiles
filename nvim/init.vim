filetype plugin indent on
syntax on

if $XDG_DATA_DIR ==# ""
  let s:data_dir = $HOME.'/.local/share/nvim'
else
  let s:data_dir = $XDG_DATA_DIR.'/nvim'
endif

" Config for ale.
let g:ale_linters = {
      \ 'cpp': ['clang', 'cppcheck'],
      \ 'java': ['javac'],
      \ 'javascript': ['eslint'],
      \ 'python': ['autopep', 'flake8', 'pylint'],
      \ }
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1

" Config for fzf.
let s:fzf_tags_options = [
      \ '--no-multi',
      \ '--delimiter= ',
      \ '--with-nth=1,2,3',
      \ '--nth=1,2',
      \ '--tiebreak=index',
      \ '--expect=ctrl-t,ctrl-v,ctrl-s',
      \ ]
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-s': 'split',
      \ }
function! s:fzf_tags_sink(lines) abort
  if empty(a:lines)
    return
  endif
  let l:cmd = get(g:fzf_action, remove(a:lines, 0), 'e')
  let l:query = a:lines[0]
  let l:parts = split(l:query, '\%u00a0')
  let l:excmd = matchstr(l:parts[3], '^.*\ze;"')
  execute 'silent ' l:cmd l:parts[1]
  let [l:magic, &magic] = [&magic, 0]
  execute l:excmd
  let &magic = l:magic
endfunction

command! Tags call fzf#run(fzf#wrap({
      \ 'source': 'ctags-relative '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')),
      \ 'options': s:fzf_tags_options,
      \ 'sink*': function('s:fzf_tags_sink'),
      \ }))
command! Buffers call fzf#run(fzf#wrap({
      \ 'source': filter(map(range(1, bufnr('$')), 'bufname(v:val)'), 'len(v:val)'),
      \ }))
command! MRU call fzf#run(fzf#wrap({
      \ 'source': v:oldfiles,
      \ }))

" Config for nvim-lspconfig.
lua require('init')

" Config for vim-dirvish.
let g:loaded_netrwPlugin = 1
let g:dirvish_mode = ':sort ,^.*[\/],'

" Config for vim-gutentags.
let g:gutentags_cache_dir = s:data_dir.'/tags/'
let g:gutentags_generate_on_empty_buffer = 1

" Config for vim-minisnip
let g:minisnip_dir = s:data_dir.'/minisnip/'

" Config for vim-signify.
let g:signify_sign_show_count = 0
let g:signify_vcs_list = [ 'git' ]

" Config for vimtex.
let g:latex_view_general_viewer = 'zathura'
let g:tex_conceal = ''
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
      \ 'callback' : 0,
      \ 'options': [
      \   '-file-line-error',
      \   '-interaction=nonstopmode',
      \   '-shell-escape',
      \   '-synctex=1',
      \   '-verbose',
      \ ]}
let g:vimtex_syntax_minted = [
      \ {'lang': 'c'},
      \ {'lang': 'cpp'},
      \ {'lang': 'java'},
      \ {'lang': 'python'},
      \ ]
let g:vimtex_view_method = 'zathura'

" Setting grepprg.
set grepformat^=%f:%l:%c:%m
if executable('rg')
  set grepprg=rg\ --vimgrep
else
  set grepprg=grep\ --recursive\ --line-number
endif
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'

" Editing config.
set autowrite
set autowriteall
set completeopt+=longest,menuone
set infercase
set diffopt+=algorithm:histogram,indent-heuristic
set formatoptions+=n
set linebreak
set nojoinspaces
set nowrap
set undofile

" Indentation.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cindent

" UI config.
set number
set relativenumber
set cursorline
set colorcolumn=100
set showmatch
set shortmess=aIT
set pumheight=10
set splitbelow
set splitright

" Disable bells.
set visualbell
set t_vb=

" Searching config.
set nohlsearch
set ignorecase
set smartcase

" Color scheme config.
set t_Co=16
set background=dark
let g:solarized_use16=1
colorscheme solarized8

" Wildmenu config.
set wildoptions-=pum
set wildmode=longest:full,full
set wildignore=.hg,.git,.svn                     " Version control.
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files.
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " Binary images.
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled object files.
set wildignore+=*.sw?                            " Vim swap files.
set wildignore+=*.DS_Store                       " OSX garbage.
set wildignore+=*.pdf,*.zip,*.so                 " Binaries.
set wildignore+=*.pyc,*.pyo                      " Python byte code.

" Displaying text.
set list
set listchars=tab:¦\ ,nbsp:•,trail:·,extends:→,precedes:←
set fillchars+=vert:│
set lazyredraw
set scrolloff=1
set sidescrolloff=5

" Folding.
set foldmethod=indent
set foldlevel=99

" Mouse config.
set mouse=a
set nomousehide

" Remap leader.
let g:mapleader="\<Space>"

" Regular j, k moves across visual lines.
" Numbered j, k moves across physical lines.
nnoremap <expr> j v:count ? 'm'''.v:count.'j' : 'gj'
nnoremap <expr> k v:count ? 'm'''.v:count.'k' : 'gk'

" vim-unimpaired bindings.
function! s:map_unimpaired(map, cmd_prefix) abort
  let l:cmd_prefix = " ':<C-u>'.(v:count ? v:count : '').'".a:cmd_prefix
  execute "nnoremap <silent> <expr> [".a:map.l:cmd_prefix."previous<CR>'"
  execute "nnoremap <silent> <expr> ]".a:map.l:cmd_prefix."next<CR>'"
  execute "nnoremap <silent> <expr> [".toupper(a:map).l:cmd_prefix."first<CR>'"
  execute "nnoremap <silent> <expr> ]".toupper(a:map).l:cmd_prefix."last<CR>'"
endfunction
call s:map_unimpaired('a', '')
call s:map_unimpaired('b', 'b')
call s:map_unimpaired('q', 'c')
call s:map_unimpaired('l', 'l')
call s:map_unimpaired('t', 't')

" Strip trailing whitespace.
function! s:strip_whitespace() abort
  let l:saved_search = @/
  let l:saved_view = winsaveview()
  %s/\s\+$//e
  call winrestview(l:saved_view)
  let @/ = l:saved_search
endfunction
command! StripWhitespace :call <SID>strip_whitespace()
nnoremap <leader>s :StripWhitespace<CR>

" Clipboard keybindings.
nnoremap <leader>y "+y
xnoremap <leader>y "+y
nnoremap <leader>p "+p
xnoremap <leader>p "+p

" Resize viewports with arrow keys.
nnoremap <silent> <Right> :vertical resize +2<CR>
nnoremap <silent> <Left> :vertical resize -2<CR>
nnoremap <silent> <Up> :resize +2<CR>
nnoremap <silent> <Down> :resize -2<CR>

" Tmux-like window zooming.
set winminwidth=0
set winminheight=0
command! Zoom call window#Zoom()
nnoremap <silent> <leader>z :Zoom<CR>

" Reload vimrc.
nnoremap <silent> <leader>r :source $MYVIMRC<CR>

" Visually select pasted or yanked text.
nnoremap gV `[v`]

" Backspace to switch to alternate file.
nnoremap <BS> <C-^>

" Write with sudo.
cmap w!! w !sudo tee >/dev/null %

" Bracket expansion.
inoremap {<CR> {<CR>}<C-o>O
inoremap {;    {<CR>};<C-o>O
inoremap (<CR> (<CR>)<C-o>O
inoremap (;    (<CR>);<C-o>O
inoremap [<CR> [<CR>]<C-o>O
inoremap [;    [<CR>];<C-o>O

" Fugitive bindings.
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gvdiffsplit<CR>
nnoremap <leader>gD :Gvdiffsplit HEAD<CR>
nnoremap <leader>gw :diffput<CR>
xnoremap <leader>gw :diffput<CR>
nnoremap <leader>gr :diffget<CR>
xnoremap <leader>gr :diffget<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gpl :Git pull<CR>
nnoremap <leader>gl :Gclog<CR>
nnoremap <leader>gL :Gclog %<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gg :Ggrep<Space>

" Fzf keybindings.
nnoremap <leader>f :FZF<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>m :MRU<CR>

function! s:highlight() abort
  " General highlighting.
  highlight Error cterm=none ctermfg=1 ctermbg=none
  highlight Normal ctermbg=none
  highlight NormalFloat ctermbg=8
  highlight NormalNC ctermbg=0
  highlight SpecialKey ctermbg=none
  highlight SpellBad cterm=underline ctermfg=none
  highlight SpellCap cterm=underline ctermfg=none
  highlight VertSplit ctermfg=10 ctermbg=0

  " Highlighting for sign column symbols.
  highlight SignColumn ctermbg=0
  highlight SignifySignAdd ctermfg=2 ctermbg=0
  highlight SignifySignChange ctermfg=3 ctermbg=0
  highlight SignifySignDelete ctermfg=1 ctermbg=0
  highlight ALEErrorSign ctermfg=1 ctermbg=0
  highlight ALEWarningSign ctermfg=3 ctermbg=0

  " Highlighting for TabLine.
  highlight TabLine cterm=none ctermfg=8 ctermbg=10
  highlight TabNum cterm=none ctermfg=8 ctermbg=10
  highlight TabLineSel cterm=none ctermfg=8 ctermbg=14
  highlight TabNumSel cterm=none ctermfg=8 ctermbg=14
  highlight TabLineFill cterm=none ctermfg=0 ctermbg=0

  " Highlighting for statusline.
  highlight StatusLineDark ctermfg=12 ctermbg=0
  highlight StatusLineLight ctermfg=0 ctermbg=14
  highlight StatusLineAccent ctermfg=15 ctermbg=1
endfunction

augroup custom
  autocmd!
  " Highlighting overrides.
  autocmd VimEnter,ColorScheme * call <SID>highlight()

  " Quickfix.
  autocmd QuickFixCmdPost [^l]* nested if &filetype != 'tex' | cwindow | endif
  autocmd BufHidden,QuitPre * nested if &filetype != 'qf' | silent! lclose | endif

  " Searching.
  autocmd CmdlineEnter [/\?] set hlsearch
  autocmd CmdlineLeave [/\?] set nohlsearch

  " Relative line number.
  autocmd WinEnter * if &filetype != 'qf' && &filetype != 'help' | set relativenumber | endif
  autocmd WinLeave * set norelativenumber
augroup end
