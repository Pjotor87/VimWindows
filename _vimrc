" ************* "
" WINDOWS START "
" ************* "
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

colorscheme evening
" *********** "
" WINDOWS END "
" *********** "
" Created by: Peter Andersson
" *******************************
" * Pathogen and basic settings *
" *******************************
" ====================================================================
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
set incsearch
set hlsearch
set number
" ***************
" * Keymappings *
" ***************
" Map leader to '-'
let mapleader = "-"
" leader + c + l = Clear line
map <leader>cl 0d$i<Del><Esc>
" leader + c + f = Clear file
map <leader>cf ggdG:call VIMRC_Prompt_Undo()<CR>
" leader + t + n + t = Toggle NERDTree
map <leader>tnt :NERDTreeToggle<CR>
" leader + f = fold"
autocmd FileType python nnoremap <leader>f zc
" leader + b = set ipdb breakpoint
autocmd FileType python nnoremap <silent> <leader>b :t.;<Esc>kiimport ipdb;ipdb.set_trace()<Esc>ld$
" leader + b + b = clear breakpoint
autocmd FileType python nnoremap <silent> <leader>bb 0d$i<Del><Esc>
" leader + b + c = clear all breakpoints
autocmd FileType python nnoremap <silent> <leader>bca :g/import ipdb;ipdb.set_trace()$/d<CR><Esc>
" leader + F5 = Run
autocmd FileType python nnoremap <silent> <F5> <Esc>:w<CR>:!python %<CR>
" leader + t + c = Toggle comments
map <leader>tc gcc
" In Visual mode: leader + c + o = Comment out selected lines
vmap <leader>co g>
" In Visual mode: leader + u + c = Uncomment selected lines
vmap <leader>uc g<
" leader + g + d = Goto definition
map <leader>gd <C-c>g<Esc>zo<Esc>llllj
" leader + r + n = Rename
autocmd FileType python map <leader>rn <C-c>rr
" leader + g + n = Global notes
map <leader>gn :sp ~/.vim/GlobalNotes<Esc><C-w>J<Esc>3<C-w>_<Esc>
" leader + q + n = Quick notes
map <leader>qn :new quicknotes<CR>:vertical resize 29<CR>Gi
" *******************************************
" * Settings for plugins loaded by Pathogen *
" *******************************************
" ====================================================================

" NERDTree
" --------
" Start NERDTree whenever starting vim without arguments
" autocmd VimEnter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Pylint
" ------
let g:PyLintCWindow = 1
let g:PyLintSigns = 1
" Set this to 0 = The operation takes long enough to get me annoyed.
let g:PyLintOnWrite = 0
" let g:PyLintDissabledMessages = 'C0103,C0111,C0301,W0141,W0142,W0212,W0221,W0223,W0232,W0401,W0613,W0631,E1101,E1120,R0903,R0904,R0913'

" Syntastic
" ---------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" TComment
" --------
runtime bundles/tplugin_vim/macros/tplugin.vim

" SimpylFold
" ----------
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 1

" UltiSnips
" ---------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader>s"
let g:UltiSnipsJumpForwardTrigger="<leader>sn"
let g:UltiSnipsJumpBackwardTrigger="<leader>sp"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" *************
" * Functions *
" *************

function VIMRC_Prompt_Undo()
  if input('Keep changes? ("y" for yes. Something else for no): ') !=? "y"
    normal u
  endif
endfunction