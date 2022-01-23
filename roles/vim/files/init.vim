" auto-install vim-plug
if has('nvim')
    if has('win32') | let plug_path = expand('~/AppData/Local/nvim/autoload/plug.vim')
    else            | let plug_path = expand('~/.local/share/nvim/site/autoload/plug.vim')
    endif
else
    if has('win32') | let plug_path = expand('~/vimfiles/autoload/plug.vim')
    else            | let plug_path = expand('~/.vim/autoload/plug.vim')
    endif
endif


let plug_remote = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

if empty(glob(plug_path))
    silent execute "!curl -fLo " . plug_path . " --create-dirs " . plug_remote
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let g:polyglot_disabled = ['python-ident']

" Begin {{{2
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" Enabled {{{2
Plug 'ryankuczka/'      . 'vim-pyfold'              " Folding: Python
Plug 'tomtom/'          . 'tcomment_vim'            " Functional: Commenting
Plug 'tpope/'           . 'vim-repeat'              " Functional: Repairs dot key for certain plugins (e.g. vim-sneak)
Plug 'ludovicchabant/'  . 'vim-gutentags'           " Miscellaneous: Ctags
Plug 'sheerun/'         . 'vim-polyglot'            " Miscellaneous: Language pack
Plug 'editorconfig/'    . 'editorconfig-vim'        " Tweak: Apply .editorconfig settings
Plug 'farmergreg/'      . 'vim-lastplace'           " Tweak: Reopen file last position
Plug 'tyrannicaltoucan/'. 'vim-quantum'             " Visual: Colorscheme
Plug 'justinmk/'        . 'vim-dirvish'             " Visual: Directory viewer
Plug 'airblade/'        . 'vim-gitgutter'           " Visual: Git gutter
Plug 'bronson/'         . 'vim-trailing-whitespace' " Visual: Highlight trailing and :FixWhitespace
Plug 'romainl/'         . 'vim-cool'                " Visual: Search highlighting tweaks

" Autocompletion {{{3
Plug 'autozimu/'        . 'LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }  " Functional: LSP

Plug 'junegunn/'        . 'fzf.vim'                 " Functional: Search

call plug#end()


syntax on
" PLUGIN SETTINGS {{{1

" deoplete {{{2
let g:deoplete#enable_at_startup = 1

" deoplete-jedi {{{2
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:deoplete#sources#jedi#ignore_errors = v:true
let g:deoplete#sources#jedi#server_timeout = 60

" deoplete-rust {{{2
let g:deoplete#sources#rust#racer_binary=expand('$HOME/.cargo/bin/racer')
"let g:deoplete#sources#rust#rust_source_path=systemlist('echo "$(rustc --print sysroot)/lib/rustlib/src/rust/src"')[0]
let g:deoplete#sources#rust#rust_source_path=expand('$RUST_SRC_PATH')

" indentguides {{{2
let g:indentguides_ignorelist = ['haskell']
let g:indentguides_spacechar = '│'

" jedi-vim {{{2
let g:jedi#smart_auto_mappings = 0

" LanguageClient-neovim {{{2
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" vim-gutentags {{{2
let g:gutentags_file_list_command = 'rg --files'

" vim-sleuth {{{2
let b:sleuth_mixed_tabstop = 4

" vim2hs {{{2
let g:haskell_conceal_enumerations = 0

" THEMING {{{1

" Colorscheme {{{2
" Favorites: cobalt, desert, hybrid_reverse, hybrid_material, quantum, solarized
let g:quantum_black=1
" colorscheme colibri
" colorscheme hybrid_material
colorscheme quantum

" Colors {{{2
set background=dark
set termguicolors

hi Normal       guibg=NONE    ctermbg=NONE
hi Normal       guifg=Grey70  ctermfg=249

hi ColorColumn  guibg=#372735
hi CursorLine   guibg=#402B3D
hi Folded       guibg=#1E161F
hi Folded       guifg=#666666

if has('gui_running')
    hi Normal guibg=DarkSlateGrey
    hi Normal guifg=PapayaWhip
endif

" Font {{{2
if has("gui_running")
    set guifont=Roboto\ Mono\ 16
endif

let g:enable_bold_font = 1

" Statusline {{{2

" Statusline definition {{{3
set statusline=                                 " Clear
set statusline+=%1*\                            " Color -
set statusline+=%t                              " Tail of the filename
set statusline+=%2*                             " Color
set statusline+=%h                              " Help file flag
set statusline+=%r                              " Read only flag
set statusline+=%3*                             " Color
set statusline+=%m                              " Modified flag
set statusline+=%=                              " Left/right separator
set statusline+=%4*\                            " Color -
" set statusline+=%{g:pluginUpdateStatus}         " Up to date plugins
set statusline+=\ \                             " --
set statusline+=%{&filetype}                    " Filetype
set statusline+=\ \                             " --
set statusline+=%{&fenc}                        " File encoding
set statusline+=[%{&ff}]                        " File format
set statusline+=[                               " Indent settings: begin
set statusline+=%{&expandtab?\"sp\":\"tab\"}\   " Indent settings
set statusline+=%{&shiftwidth}                  " Indent settings
set statusline+=]                               " Indent settings: end
set statusline+=\ %5*\ \ \                      " - Color ---
set statusline+=%2c                             " Cursor column
set statusline+=\ \                             " --
set statusline+=%2v                             " Cursor column (virtual)
set statusline+=\ \                             " --
set statusline+=(%l\ /\ %L)                     " Cursor line/total lines
" set statusline+=\ \                             " --
" set statusline+=%P                              " Percent through file

" Statusline colors {{{3
hi User1 ctermfg=250 ctermbg=234
hi User2 ctermfg=008 ctermbg=234
hi User3 ctermfg=143 ctermbg=234
hi User4 ctermfg=237 ctermbg=233
hi User5 ctermfg=238 ctermbg=233

" Window title {{{2
set title               " Change window title to current buffer
set titlestring=%t      " Change window title

" Highlight groups {{{2
autocmd BufEnter * syn keyword Todo NOTE  containedin=.*Comment
autocmd BufEnter * syn keyword Todo DEBUG containedin=.*Comment

" OPTIONS {{{1

" Conceal {{{2
set conceallevel=0
let g:tex_conceal = ""
let g:vim_json_syntax_conceal = 0

" Folding {{{2
set fillchars=fold:\
"set foldlevelstart=20
set foldnestmax=4
set foldtext=FoldTextStyle()

" GUI {{{2
if has("gui_running")
    set guioptions -=m  " Remove menubar
    set guioptions -=T  " Remove toolbar
endif

" Indenting and Tabs {{{2
set expandtab
set shiftwidth=4        " Spaces [>>]  key is equivalent to
set softtabstop=4       " Spaces [tab] key is equivalent to
set tabstop=4           " Tab display width

" Python indenting {{{3
let g:pyindent_continue     = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_open_paren   = '&sw'

" VHDL indenting {{{3
let g:vhdl_indent_genportmap = 0

" Miscellaneous {{{2
set hidden              " Allow switching buffers with unwritten changes
set wildignore+=*.pdf,*.o,*.obj,*.jpg,*.png,*.pyc  " Do not list
set wildmode=list:longest

" Search {{{2
set hlsearch            " Highlight search results
set ignorecase          " Ignore case
"set magic              " Escape like regular regexes; use \V to revert
set smartcase           " Ignore case if lower

if has('nvim')
    set inccommand=nosplit  " Incremental highlight during :%s
endif

" Undo {{{2
set undodir=$HOME/.vim/undo " Where to save undo histories
set undofile                " Save undo's after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " Number of lines to save for undo

" Visual {{{2
set colorcolumn=80      " Column guide
" let &colorcolumn=join(range(81,999), ",") " Column guide
set cursorline          " Highlight current line
set laststatus=2        " Show status line
set mouse=a             " Mouse interactivity
set numberwidth=2       " Numbering column width
set relativenumber      " Relative line numbers
set scrolloff=2         " Keep some lines visible when scrolling to edges of screen

" AUTOCMDS {{{1

" Auto close preview {{{2
autocmd InsertLeave * silent! pclose!

" Autocompletion {{{2
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Check up to date plugins {{{2
autocmd VimEnter * call CheckForUpdates()

" Conceal level {{{2
autocmd FileType markdown setlocal conceallevel=0

" Disable continue comment on new line {{{2
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Folding {{{2
autocmd FileType conf,markdown,python,vim,zsh let anyfold_activate=0
autocmd FileType conf,markdown,python,vim,zsh setlocal foldminlines=1

"autocmd FileType *       setlocal foldcolumn=3 foldmethod=indent
autocmd FileType conf     setlocal foldcolumn=3 foldmethod=expr   foldexpr=FoldConfig()
autocmd FileType i3       setlocal foldcolumn=3 foldmethod=expr   foldexpr=FoldConfig()
autocmd FileType markdown setlocal foldcolumn=3 foldmethod=expr   foldexpr=FoldMarkdown()
autocmd FileType vim,zsh  setlocal foldcolumn=3 foldmethod=marker
autocmd FileType c,cpp    setlocal foldcolumn=3 foldmethod=syntax
autocmd FileType java     setlocal foldcolumn=3 foldmethod=syntax
autocmd FileType rust     setlocal foldcolumn=3 foldmethod=syntax foldnestmax=2
autocmd FileType python   setlocal foldtext=FoldTextStyle()

" Indenting and Tabs {{{2
autocmd FileType fortran  setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType haskell  setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType lisp     setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType markdown setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType python   setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType tex      setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4

let fortran_do_enddo=1
let fortran_free_source=1
let fortran_fold=1

" Remove trailing whitespace on file save {{{2
"autocmd FileType c,cpp,python autocmd BufWritePre <buffer> :FixWhitespace

" Syntax highlighting {{{2
autocmd BufRead,BufNewFile *.cls set filetype=tex
autocmd BufRead,BufNewFile *.nxc set filetype=cpp

" COMMANDS {{{1

" Copy search matches {{{2
command! -register CopyMatches call <SID>CopyMatches(<q-reg>)

" fzf {{{2
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%'),
  \                 <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir LocateFiles
  \ call fzf#run(fzf#wrap({
  \     'source': 'locate --database=./.locate.db <q-args>',
  \     'options': '-m' },
  \   <bang>0))

" FUNCTIONS {{{1

" Check backspace {{{2
function! s:CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Check for plugin updates {{{2
" Modified from https://gitbub.com/semanser/vim-outdated-plugins
function! s:JobHandlerVim(chanell, msg)
    if (a:msg =~ "is behind")
        let g:needToUpDate += 1
        let g:pluginUpdateStatus = string(g:needToUpDate) . ' new updates'
    endif
endfunction

function! s:JobHandlerNeovim(job_id, data, event) dict
    if (join(a:data) =~ "is behind")
        let g:needToUpDate += 1
        let g:pluginUpdateStatus = string(g:needToUpDate) . ' new updates'
    endif
endfunction

function! CheckForUpdates()
    let g:needToUpDate = 0
    let g:pluginUpdateStatus = ''
    let s:callbacksNeovim = {'on_stdout': function('s:JobHandlerNeovim')}
    let s:callbacksVim    = {'out_cb':    function('s:JobHandlerVim')}

    " TODO check only activated plugins and not all downloaded
    if has('nvim')
        for key in keys(g:plugs)
            let job2 = jobstart( ['bash', '-c', "cd " . g:plugs[key].dir ." && git remote update && git status -uno"], s:callbacksNeovim)
        endfor
    else
        for key in keys(g:plugs)
            let job2 = job_start(['bash', '-c', "cd " . g:plugs[key].dir ." && git remote update && git status -uno"], s:callbacksVim)
        endfor
    endif
endfunction

" Copy search matches {{{2
function! s:CopyMatches(reg)
    let hits = []
    %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
    let reg = empty(a:reg) ? '+' : a:reg
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction

" Folding {{{2
" Fold config files {{{3
function! FoldConfig()
    let thisline = getline(v:lnum)
    let matchline = matchstr(thisline, '^#\+.\+#\+$')
    let match = matchstr(matchline, '^#*')
    let level = strlen(match)

    if level > 0
        "return ">" . string(level)
        return ">1"
    endif

    return "="
endfunction

" Fold markdown files {{{3
function! FoldMarkdown()
    let thisline = getline(v:lnum)
    let match = matchstr(thisline, '^#*')
    let level = strlen(match)

    if level > 0
        return ">" . string(level)
    endif

    return "="
endfunction

" Fold text style {{{3
function! FoldTextStyle()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 2

    let foldlinecount = v:foldend - v:foldstart
    let posttext = "  " . foldlinecount . " lines   +  ----"

    let spacetab = strpart('         ', 0, &tabstop)
    let line = substitute(line, '\t', spacetab, 'g')
    let line = strpart(line, 0, windowwidth - len(posttext))

    let filltext = repeat(" ", windowwidth - len(line) - len(posttext))

    return line . filltext . posttext
endfunction

" Word wrap {{{2
function! s:ToggleWrap()
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap <buffer> <silent> k gk
    noremap <buffer> <silent> j gj
endfunction

" KEYBOARD MAPPINGS {{{1

" fzf {{{3
nnoremap <Tab>     :Buffers<CR>
nnoremap ,         :GFiles<CR>
nnoremap <Leader>s :LocateFiles .<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>a :Ag!<CR>
nnoremap <Leader>r :Rg!<CR>
nnoremap <Leader>m :Marks<CR>
nnoremap <Leader>t :Tags<CR>
