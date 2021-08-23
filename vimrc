" -------------------------------------------------------------------------------------------------------------------------------------------------
"
"        Author: wuseman <wuseman@nr1.nu>
"
"      FileName: vimrc
"   Description: my personal configuration file for vim: 
"       License: Copyright (c) 2021, wuseman
"
" -------------------------------------------------------------------------------------------------------------------------------------------------


                                   

" - For newbies  ----------------------------------------------------------------------------------------------------------------------------------
"
"     If you're new to vim and using my conf, uncomment below for getting started
"     to use vim as its meant to be, you will happy when you get used to use vim
"     trust me :) 
"
" - -----------------------------------------------------------------------------------------------------------------------------------------
" Learn to use vim propery, noob
" nnoremap <Left>  :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up>    :echoe "Use k"<CR>
" nnoremap <Down>  :echoe "Use j"<CR>


                                                   

" - Folders ---------------------------------------------------------------------------------------------------------------------------------------
"
"    This is important, leader is set as: ,
"
" -------------------------------------------------------------------------------------------------------------------------------------------------
let mapleader = ","
let g:mapleader = ","


                                                   

" - System stuff _---------------------------------------------------------------------------------------------------------------------------------
"
"    For system())
"
" -------------------------------------------------------------------------------------------------------------------------------------------------
let os = substitute(system('uname'), "\n", "", "")


                                                   

" - Folders ----------------------------------------------------------------------------------------------------------------------------------------
"
"    Paths we use for storing vim files
"
" --------------------------------------------------------------------------------------------------------------------------------------------------
set backupdir=~/.vim/backup/
set directory=~/.vim/swaps


                                                   

" -------------------------------------------------------------------------------------------------------------------------------------------------
"
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
"
" -------------------------------------------------------------------------------------------------------------------------------------------------
set nocompatible


                                                   

" - Theme -----------------------------------------------------------------------------------------------------------------------------------------
"
"    Place themes in: $HOME/.vim/colors
"
" -------------------------------------------------------------------------------------------------------------------------------------------------
colorscheme w    


                                                   

" - Various / General settings --------------------------------------------------------------------------------------------------------------------
"
"    We keep it clean and simple with minimal descriptions for help
"
" -------------------------------------------------------------------------------------------------------------------------------------------------
set autoindent 																												" THis is cool (https://kb.iu.edu/d/afcw)
set autowrite                                                                                                               " Automatically save before commands like :next and :make
set backspace=indent,eol,start                                                                                              " Make backspace behave in a sane manner.
set cmdheight=1                                                                                                             " Commandline height
set cryptmethod=blowfish2                                                                                                   " Cryptmethod (zip, blowfish, blowfish2)
set cursorline                                                                                                              " Colorize current line
set encoding=utf-8 nobomb                                                                                                   " Set utf8 as standard encoding and en_US as the standard language
set expandtab                                                                                                               " Expand TABs to spaces
set ffs=unix,dos,mac                                                                                                        " Use Unix as the standard file type
set gdefault                                                                                                                " RegExp global by default
set hidden                                                                                                                  " Allow hidden buffers, don't limit to 1 file per window/split
set hlsearch                                                                                                                " Enable Highlight Search
set ignorecase                                                                                                              " Case Insensitivity Pattern Matching
set incsearch                                                                                                               " Highlight while search
set laststatus=2																											" Show bar below command line
set magic                                                                                                                   " Enable extended regexes.
set matchpairs+=<:>                                                                                                         " Highlight matching pairs of brackets. Use the '%' character to jump between them.
set mouse=                                                                                                                  " Enable mouse support
set nocompatible																											" Set to not be completely Vi compatible
set nowrap                                                                                                                  " No wrap please
set number                                                                                                                  " Show numbered lines
set shiftround                                                                                                              " Shift to the next round tab stop.
set shiftwidth=4                                                                                                            " Indents will have a width of 4
set showcmd                                                                                                                 " Show command in bottom bar
set showmatch                                                                                                               " highlight matching [{()}]
set showmode																												" If in Insert, Replace or Visual mode put a message on the last line
set showtabline=2                                                                                                           " Show tabs above vim
set smartcase                                                                                                               " Overrides ignorecase if pattern contains upcase
set softtabstop=4                                                                                                           " Sets the number of columns for a TAB
set swapfile																												" Use swap files
set tabstop=4                                                                                                               " The width of a TAB is set to 4. 
set ttyfast                                                                                                                 " Speed up scrolling in Vim
set wildmenu                                                                                                                " Visual autocomplete for command menu


                                                   
" - Statusline -----------------------------------------------------------------------------------------------------------------------------------------
"
"     For statusline
"
" - --------------------------------------------------------------------------------------------------------------------------------------------------
"
"  					 To be re-added
"


                                                   
" - List NFO(.nfo) extensions properly  -----------------------------------------------------------------------------------------------------------------
"
"    This will show nfo with ASCII as its meant to be viewed
"
" - -----------------------------------------------------------------------------------------------------------------------------------------------------
function! SetFileEncodings(encodings)
  let b:myfileencodingsbak=&fileencodings
  let &fileencodings=a:encodings
endfunction

function! RestoreFileEncodings()
  let &fileencodings=b:myfileencodingsbak
  unlet b:myfileencodingsbak
endfunction


                                                   

" - Bash / Shell stuff ------------------------------------------------------------------------------------------------------------------------
"
"    - https://vim.fandom.com/wiki/Append_output_of_an_external_command
"
" ----------------------------------------------------------------------------------------------------------------------------------------------
command! -nargs=* -complete=shellcmd R new | setlocal stab noswapfile | r !<args>


function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize '
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)



                                                   

" - Shebangs -------------------------------------------------------------------------------------------------------------------------------------
"
"    Add shebangs to files via autocmd by file extension
"    - This must be updated - notice by wuseman, your lazy cow 
"
" - ----------------------------------------------------------------------------------------------------------------------------------------------
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: iso-8859-15 -*-\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
augroup END



                                                   

" - Headers -----------------------------------------------------------------------------------------------------------------------------------------
"
"    Below will add header to our new scripts for us and add what's needed
"
"    Help if we for some reason forgets what things are for: 
"    au – is autocmd, run commands auto for us
"    bufnewfile – event for opening a file that doesn’t exist for editing.
"    *.sh – consider all files with .sh extension.
"
" - --------------------------------------------------------------------------------------------------------------------------------------------------
au BufNewFile *.sh 0r ~/.vim/headers/bash_header.sh
autocmd bufnewfile *.sh exe "1," . 6 . "g/FileName :.*/s//FileName : " .expand("%")
autocmd bufnewfile *.sh exe "1," . 9 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d (%H:%M:%S)")
autocmd Bufwritepre,filewritepre *.sh exe "1," . 10 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d (%H:%M:%S)")
autocmd Bufwritepre,filewritepre *.sh exe "1," . 43 . "g/###########################################################################"
                                                 


                                                   

" - Mappings for Bash scripting ---------------------------------------------------------------------------------------------------------------------
"
"    IN this section we store various mappings for make our life easier when we working with shell scripts
"
" - --------------------------------------------------------------------------------------------------------------------------------------------------
nnoremap ^BF i<ESC>o<ESC>ofunction editme() {<ESC>o<ESC>o}<ESC>ki<S-TAB>                                                            " Insert a Function 



                                                   

" - Mappings  ------------------------------------------------------------------------------------------------------------------------------------------
"
"    We keep it clean and simple with minimal descriptions for help
"
" - -----------------------------------------------------------------------------------------------------------------------------------------------------
nnoremap - $                                                                                                                        " Home & End should be placed next to each other
nnoremap <C-Left> :tabprevious<CR>                                                                                                  " Show previous tab               
nnoremap <C-Right> :tabnext<CR>                                                                                                     " Show next tab
nnoremap <leader>n :set number!<CR>                                                                                                 " Hit ,n for toggle showing numbers
nnoremap B ^                                                                                                                        " Move to begin of line
nnoremap E $                                                                                                                        " Move to end of line
nnoremap Q :q!<CR>                                                                                                                  " Quickly quit editting without save
nnoremap RA :%s///g<left><left>                                                                                                     " Replace all matches
nnoremap RO :s///g<left><left>                                                                                                      " Replace the current search
nnoremap S  :x<CR>                                                                                                                  " Quickly quit editting and save
nnoremap S  :x<CR>                                                                                                                  " Quickly quit editting and save
nnoremap ww :w!<CR>                                                                                                                 " Quick Save Without Quit
nnoremap Y y$                                                                                                                       " Yank(Copy) to end line                                                       
nnoremap vA ggVG                                                                                                                    " Select all text
nnoremap va ggVG                                                                                                                    " Select all text
nnoremap <leader>s <c-w>s<c-w>j                                                                                                     " Make a new vertical split via ,s
nnoremap <leader>v <c-w>v<c-w>l                                                                                                     " Make a vertical split via ,v
nnoremap <leader>x <c-w>c                                                                                                           " Close a split via ,c
nnoremap w!! w !sudo tee % >/dev/null                                                                                               " Saves the file (handling the permission-denied error)
nnoremap gX :silent :execute "!xdg-open" expand('%:p:h') . "/" . expand("<cfile>") " &"<cr>                                         " Open current default browser



                                                   

" -  Copy / Paste / Cut ---------------------------------------------------------------------------------------------------------------------------------
"
"     Copy and paste to your clipboard on a linux machine, this require vim-gtk(3)
""
" - -----------------------------------------------------------------------------------------------------------------------------------------------------
set clipboard=unnamed                                                                                                               " For set paste method
map <leader>P "+y                                                                                                                   " Use ,P for copy to linux clipboard, this require vim-gtk3



                                                   

" - Mappings for bash scripting ----------------------------------------------------------------------------------------------------------------------
"
"    For make our life easier in cli
"
" - --------------------------------------------------------------------------------------------------------------------------------------------------
nnoremap ^BF i<ESC>o<ESC>ofunction editme() {<ESC>o<ESC>o}<ESC>ki<S-TAB>                                                            " Insert a function example   



                                                   

" - Autocmd ------------------------------------------------------------------------------------------------------------------------------------
"
"    Uncomment the following to have Vim load indentation rules and plugins according to the detected filetype.
"
" - ----------------------------------------------------------------------------------------------------------------------------------------------------- 
"if has("autocmd")
"  filetype plugin indent on
"endif



                                                   

" - Date  -----------------------------------------------------------------------------------------------------------------------------------------------
"
"    Insert current date by ctrl+D, examples added
"
" - -----------------------------------------------------------------------------------------------------------------------------------------------------
"
"    Examples:			
""
" 			%c                         Thu 27 Sep 2007 07:37:42 AM EDT (depends on locale)
" 			%a %d %b %Y                Thu 27 Sep 2007
"			%b %d, %Y                  Sep 27, 2007
" 			%d/%m/%y %H:%M:%S          27/09/07 07:36:32
" 			%H:%M:%S                   07:36:44
" 			%T                         07:38:09
" 			%m/%d/%y                   09/27/07
" 			%y%m%d                     070927
" 			%x %X (%Z)                 09/27/2007 08:00:59 AM (EDT)
"			% Y-%m-%d                   2016-11-23
" 			%F                         2016-11-23 (works on some systems)
"
" - ------------------------------------------------------------------------------------------------------------------------------------------------------
" :inoremap <F5> <C-R>=strftime("%c")<CR>
" :nnoremap <F5> "=strftime("%d/%m/%y %H:%M:%S")<CR>P
nnoremap <leader>D "=strftime("%d/%m/%y %H:%M:%S")<CR>P



                                                   

" - Autocommands ----------------------------------------------------------------------------------------------------------------------------------------
"
"    Stuff in this part is for do things auto, for example autocmd new files in tabs
"
" - -----------------------------------------------------------------------------------------------------------------------------------------------------
au BufAdd,BufNewFile * nested tab sball                                                                          " Open new files in a new statusline



                                                   


" - Entering file ----------------------------------------------------------------------------------------------------------------------------------------
"
"    Reopen file at same line you quit, uncomment for get at line nr1 begin at top
"
" - -----------------------------------------------------------------------------------------------------------------------------------------------------
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif



                                                   

" - Good urls -------------------------------------------------------------------------------------------------------------------------------------------
"
"   Useful sites for get deeper into vim
"
" - -----------------------------------------------------------------------------------------------------------------------------------------------------
" https://github.com/WolfgangMehner/bash-support/tree/master/bash-support/codesnippets
" https://vim.fandom.com/wiki/Best_Vim_Tips#Get_output_from_shell_commands
" http://zzapper.co.uk/vimtips.html
" https://gist.github.com/mitry/813151
" https://unix.stackexchange.com/questions/523090/vim-autostart-with-vexplore-and-terminal
" https://gist.github.com/stardiviner/3891591
" https://alapono.eng.hawaii.edu//Tutor/vi.html
" http://www.yolinux.com/TUTORIALS/LinuxTutorialAdvanced_vi.ht22/08/21 20:06:15m
" https://www.artificialworlds.net/presentations/vim-for-fun/vim-for-fun.html


" - The End  ---------------------------------------------------------------------------------------------------------------------------------------------