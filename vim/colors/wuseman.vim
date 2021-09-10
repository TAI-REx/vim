" Vim color file - w 
" -------------------------------------------------------------------------------------------------------------------------------------------------
"    __      ___   _ ___  ___ _ __ ___   __ _ _ __
"    \ \ /\ / / | | / __|/ _ \ '_ ` _ \ / _` | '_ \
"     \ V  V /| |_| \__ \  __/ | | | | | (_| | | | |
"      \_/\_/  \__,_|___/\___|_| |_| |_|\__,_|_| |_|
"
"
"          Author: wuseman <wuseman@nr1.nu>
"     
"        FileName: vimrc
"        Modified: 2021-09-06 (01:17:42
"
"     Description: my personal configuration file for vim: 
"         License: Copyright (c) 2021, wuseman
"
"--------------------------------------------------------------------------------------------------------------------------------------------------------


set t_Co=256
let g:colors_name = "wuseman"
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif




" Comment
hi Comment guifg=#b0b0b0 ctermfg=244


" Line/LinenNR(in reverse only)
hi LineNr guifg=#ffffff ctermfg=14
hi LineNrAbove guifg=#ffffff  ctermfg=2  
hi LineNrBelow guifg=#ffffff ctermfg=3  

" Constant
hi Constant guifg=#ffffff ctermfg=15E

" Cursor
hi CursorLine ctermbg=234 
hi CursorLineNr ctermfg=cyan

" DIrectory
hi Directory ctermfg=105 

" Identifier
hi Identifier ctermfg=10 
" NonText
hi NonTextd ctermfg=241 ctermbg=233 cterm=bold

hi PreProc ctermbg=NONE
hi SpecialChar ctermbg=235
hi SpecialComment ctermbg=235
hi Special ctermbg=235
hi SpecialKey ctermbg=NONE

" Statements = Commands:
" echo, mkdir etc
hi Statement ctermfg=45

" Statuslien
hi StatusLineNC guifg=#8787af guibg=#000000 guisp=#000000 gui=NONE ctermfg=103 ctermbg=236 cterm=NONE
hi StatusLine guifg=#ffffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=15 ctermbg=236 cterm=NONE

" Tabline
hi TabLineSel guifg=#dadada guibg=#585858 guisp=#585858 gui=NONE ctermfg=253 ctermbg=240 cterm=NONE
hi TabLineFill guifg=NONE guibg=#000000 guisp=#000000 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi TabLine guifg=#afafaf guibg=#000000 guisp=#000000 gui=NONE ctermfg=145 ctermbg=236 cterm=NONE


" hi Statement guifg=#48ff00 guibg=NONE guisp=NONE gui=bold ctermfg=82 ctermbg=NONE cterm=bold

hi Statement guifg=#48ff00 guibg=NONE guisp=NONE gui=bold ctermfg=82 ctermbg=NONE cterm=bold
hi String guifg=#ffffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=15 ctermbg=235 cterm=NONE




" Selected text in visual
hi Visual ctermbg=blue 

" Splits
hi vertsplit ctermbg=3 cterm=none 
hi split ctermbg=3 cterm=none 
  

" This is for getopts for example "-v -x -h" and so on < >  if, then, else, endif, switch, etc.
hi Conditional ctermfg=15 

" This is for | and [[ ]]
hi Operator ctermfg=brown cterm=bold





hi Scrollbar ctermfg=red
