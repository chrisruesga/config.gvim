set nocompatible
source $HOME/.vim/plugin/matchit.vim  "Enable Match it (shift 5) or % to match begin/end if/else ...

syn       on        "Turn on syntax highlight
filetype  indent off "Turn on indents by filetype
filetype  plugin on "Turn on plug-in by filetpye, such as matchit
"set indentkeys-=<:>


if has("gui_running")
""    set lines=999 columns=999
"" "  if has("gui_photon")
""     "set   guifont=Courier\ New\ 13
""     "set   guifont=Fixed\ 12 "Font set to Fixed 12
""     "set   guifont=Bitstream\ Vera\ Sans\ Mono\ 14
""     "set   guifont=Misc\ Fixed\ 12
""     set   guifont=Source\ Code\ Pro\ Semibold\ 14
""
"" "  endif
endif
"set   guifont=ProggyVector\ 14
"set   guifont=Source\ Code\ Pro\ Semibold\ 14
 set   guifont=JetBrains\ Mono\ NL\ 14
 set   hls               "Turn on highlight search
 set   virtualedit=all   " Allow for cursor beyond last character
 set   shiftwidth=2      "On shift, use two spaces
 set   tabstop=2         "tab = two spaces
 set   tabpagemax=50     "Max of two file tabs
 set   guitablabel=%t\ %m  "Change gui tab label to file_name [modify flag]
 set   softtabstop=2     "Edit tabs are 2 spaces
 set   expandtab         "Hitting tab creates 2 spaces
 set   number            "Show line numbers
"set   smartindent
"set   cindent           "Indent with C indenting rules
"set   cinkeys-=0#
"set   indentkeys-=0#
"inoremap # X#<left><backspace><right>
 set   bs=2              "Same as set backspace=indent,eol,start"
 set   undolevels=1000   "1000 undo operations
 set   statusline=[%f][ROW:\ %6l]\ [COL:\ %6v]\ [%p%%]\ [LINES=%L]\ %m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y] " status line at bottom of gvim
 set   laststatus=2      "Status line is a height of two, one for commands, other for above status line
 set   ignorecase        "on search ignore case in text
 set   smartcase         "if search arg has case, override ignorecase
 set   guioptions+=b     "Enable Horizontal Scroll Bar
 set   nowrap            "Turn off text wrapping
 set   tw=0              "Max text width
"set   list listchars=trail:.,extends:>  "Show trailing white spaces
 set   cursorline        "Enable Cursor Line Highlight
 set   spell spl=en_us   " Select language
 set   nospell           " Turn it off at start
 set   foldmethod=syntax " Turn on folder based on syntax
 set   foldnestmax=1
 set   encoding=utf-8    " Fixes NerdTree
"set foldmethod=expr
"set foldexpr=empty(getline(v:lnum))?'=':indent(v:lnum)/4
set textwidth=0
set wrapmargin=0
autocmd FileType text set textwidth=0

colorscheme test
"" When using vimdiff or diff mode
"highlight DiffAdd    term=bold         ctermbg=darkgreen ctermfg=white    cterm=bold guibg=DarkGreen  guifg=White    gui=bold
"highlight DiffText   term=reverse,bold ctermbg=red       ctermfg=yellow   cterm=bold guibg=DarkRed    guifg=yellow   gui=bold
"highlight DiffChange term=bold         ctermbg=black     ctermfg=white    cterm=bold guibg=Black      guifg=White    gui=bold
"highlight DiffDelete term=none         ctermbg=darkblue  ctermfg=darkblue cterm=none guibg=DarkBlue   guifg=DarkBlue gui=none
"" When viewing a diff or patch file
"highlight diffRemoved term=bold ctermbg=black   ctermfg=red    cterm=bold guibg=DarkRed     guifg=white gui=none
"highlight diffAdded   term=bold ctermbg=black   ctermfg=green  cterm=bold guibg=DarkGreen   guifg=white gui=none
"highlight diffChanged term=bold ctermbg=black   ctermfg=yellow cterm=bold guibg=DarkYellow  guifg=white gui=none
"highlight diffLine    term=bold ctermbg=magenta ctermfg=white  cterm=bold guibg=DarkMagenta guifg=white gui=none
"highlight diffFile    term=bold ctermbg=yellow  ctermfg=black  cterm=none guibg=DarkYellow  guifg=white gui=none

""colorscheme default
"" "Source window colors
"" highlight Normal     guibg=Black guifg=White
"" highlight Cursor     guibg=Green guifg=NONE
"" highlight lCursor    guibg=Cyan  guifg=NONE
"" highlight NonText    guibg=Black
"" highlight Constant   gui=NONE    guibg=Black
"" highlight Special    gui=NONE    guibg=Black
"" highlight CursorLine guifg=NONE  guibg=grey20
"" highlight FoldColumn guifg=Black guibg=Yellow
"" highlight Folded     guifg=Black guibg=grey60
"""""""""""""""""""""""""""""""""""""""""""""""""
" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

" Add trailing spaces
function AddWhiteSpace()
  %s/$/                      /
  ''
:endfunction

function TabLeft()
   let tab_number = tabpagenr() - 1
   if tab_number == 0
      execute "tabm" tabpagenr('$') - 1
   else
      execute "tabm" tab_number - 1
   endif
endfunction

function TabRight()
   let tab_number = tabpagenr() - 1
   let last_tab_number = tabpagenr('$') - 1
   if tab_number == last_tab_number
      execute "tabm" 0
   else
      execute "tabm" tab_number + 1
   endif
endfunction

augroup gzip
 autocmd!
 autocmd BufReadPre,FileReadPre *.gz set bin
 autocmd BufReadPost,FileReadPost   *.gz '[,']!gunzip
 autocmd BufReadPost,FileReadPost   *.gz set nobin
 autocmd BufReadPost,FileReadPost   *.gz execute ":doautocmd BufReadPost " . expand("%:r")
 autocmd BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
 autocmd BufWritePost,FileWritePost *.gz !gzip <afile>:r
 autocmd FileAppendPre      *.gz !gunzip <afile>
 autocmd FileAppendPre      *.gz !mv <afile>:r <afile>
 autocmd FileAppendPost     *.gz !mv <afile> <afile>:r
 autocmd FileAppendPost     *.gz !gzip <afile>:r
augroup END

""tmenu ToolBar.diff_nc Diff - Jump to the next change
""amenu ToolBar.diff_nc ]c<CR>
""
""tmenu ToolBar.diff_pc Diff - Jump to the previous change
""amenu ToolBar.diff_pc [c<CR>
""
""tmenu ToolBar.diff_do Diff - Get changes from other window into the current window
""amenu ToolBar.diff_do :do<CR>
""
""tmenu ToolBar.diff_dp Diff - Put the changes from current window into the other window.
""amenu ToolBar.diff_dp :dp<CR>
""
""tmenu ToolBar.diff_up Diff - recalculate the diff
""amenu ToolBar.diff_up :diffu<CR>
""
""tmenu ToolBar.noscrolllock Diff - Disable Scroll Lock
""amenu ToolBar.noscrolllock :set noscrollbind<CR>
""
""tmenu ToolBar.scrolllock Diff - Enable Scroll Lock
""amenu ToolBar.scrolllock :set scrollbind<CR>
""
""tmenu ToolBar.diffg_lo Diff - 3Way Merge - Grab changes from Local
""amenu ToolBar.diffg_lo :diffg LO<CR>
""
""tmenu ToolBar.diffg_ba Diff - 3Way Merge - Grab changes from Base
""amenu ToolBar.diffg_ba :diffg BA<CR>
""
""tmenu ToolBar.diffg_re Diff - 3Way Merge - Grab changes from Remote
""amenu ToolBar.diffg_re :diffg RE<CR>
""
tmenu ToolBar.diff_igws Diff - Ignore Whitespace
amenu ToolBar.diff_igws :set diffopt+=iwhite<CR>

tmenu ToolBar.diff_ws Diff - Diff Whitespace
amenu ToolBar.diff_ws :set diffopt-=iwhite<CR>

fun! ShowFuncName()
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bWn'))
  echohl None
endfun
map f :call ShowFuncName() <CR>
fun! ShowModName()
  echohl ModeMsg
  echo getline(search("^\s*module\s+", 'bWn'))
  echohl None
endfun
map m :call ShowModName() <CR>



"=======================================================
"== Keyboard/Mouse Shortcuts
"=======================================================

"Backspace using backspace key
"imap <BS> <LEFT><DEL>
"map  <BS> <S-X>

"Undo like windows
map  <C-Z> u
imap <C-Z> <ESC><C-Z>i

"Remove Trailing white spaces
map  <F2> :call TrimWhiteSpace()<CR>
imap <F2> <ESC><F2><insert>

"Add trailing white spaces
""map  <F3> :call AddWhiteSpace()<CR>
""imap <F3> <ESC><F3><insert>
map  <F3> :set relativenumber!<CR>
imap <F3> <ESC><F3><insert>

"Turn off highlight
map  <F4> :noh<CR>

"Retab with current settings
map  <F5> :retab<CR>

"toggle spell check
nmap <F6> :set spell!<CR>

"Search for non-ascii characters
map  <F7>   /[^\x00-\x7F]<CR>
imap <F7>   :<ESC><F7><insert>

"Set cwd to current file path
map  <F8>  :cd %:p:h<CR>
imap <F8>  :<ESC><F8><insert>

map  <F9>  :diffput<CR>
imap <F9>  :<ESC><F9><insert>

map  <F11> :echo resolve(expand('%:p'))<CR>

set guioptions-=k "Vim that the window size is not going to change when the font size changes
set guioptions-=L "Vim that the window size is not going to change when the font size changes
nnoremap <C-Up> :silent! let &guifont = substitute(
 \ &guifont,
 \ '\zs\d\+$',
 \ '\=eval(submatch(0)+1)',
 \ '')<CR>
nnoremap <C-Down> :silent! let &guifont = substitute(
 \ &guifont,
 \ '\zs\d\+$',
 \ '\=eval(submatch(0)-1)',
 \ '')<CR>

"map <C-ScrollWheelUp>     
"map <C-ScrollWheelDown>   

""Hold Ctrl Drap Right Mouse to Block Select
"noremap <C-RightMouse> <RightMouse><Esc><C-V>
"noremap <C-RightDrag>  <RightDrag>
noremap  <C-MiddleMouse>  :ts<CR>

"Move Tab to Right
map <silent><C-S-Right> :execute TabRight()<CR>
"Move Tab to Left
map <silent><C-S-Left>  :execute TabLeft()<CR>
"=======================================================

function! MyToHtml(line1, line2)
  " make sure to generate in the correct format
  let old_css = 1
  if exists('g:html_use_css')
    let old_css = g:html_use_css
  endif
  let g:html_use_css = 0

  " generate and delete unneeded lines
  exec a:line1.','.a:line2.'TOhtml'
  %g/<body/normal k$dgg

  " convert body to a table
  %s/<body\s*\(bgcolor="[^"]*"\)\s*text=\("[^"]*"\)\s*>/<table \1 cellPadding=0><tr><td><font color=\2>/
  %s#</body>\(.\|\n\)*</html>#\='</font></td></tr></table>'#i

  " restore old setting
  let g:html_use_css = old_css
endfunction
command! -range=% MyToHtml :call MyToHtml(<line1>,<line2>)
