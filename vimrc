" -------------------------------------------------------------------------------------------------------------------------------------------------
"    __      ___   _ ___  ___ _ __ ___   __ _ _ __
"    \ \ /\ / / | | / __|/ _ \ '_ ` _ \ / _` | '_ \
"     \ V  V /| |_| \__ \  __/ | | | | | (_| | | | |
"      \_/\_/  \__,_|___/\___|_| |_| |_|\__,_|_| |_|
"
"
"        Author: wuseman <wuseman@nr1.nu>
"    
"      FileName: vimrc
"      Modified: 2021-09-21 (06:23:06)
"
"   Description: my personal configuration file for vim: 
"
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

 
" - GNU/Linux Manuals -----------------------------------------------------------------------------------------------------------------------------
"
"    Set editor / viewer and colors gnu manuals in vim
"
" -------------------------------------------------------------------------------------------------------------------------------------------------
syn match manSectionHeading "^\s\+[0-9]\+\.[0-9.]*\s\+[A-Z].*$" contains=manSectionNumber
syn match manSectionNumber "^\s\+[0-9]\+\.[0-9]*" contained
syn region manDQString start='[^a-zA-Z"]"[^", )]'lc=1 end='"' contains=manSQString
syn region manSQString start="[ \t]'[^', )]"lc=1 end="'"
syn region manSQString start="^'[^', )]"lc=1 end="'"
syn region manBQString start="[^a-zA-Z`]`[^`, )]"lc=1 end="[`']"
syn region manBQSQString start="``[^),']" end="''"
syn match manBulletZone transparent "^\s\+o\s" contains=manBullet
syn case match
syn keyword manBullet contained o
syn match manBullet contained "\[+*]"
syn match manSubSectionStart "^\*" skipwhite nextgroup=manSubSection
syn match manSubSection ".*$" contained

hi link manSectionNumber Number
hi link manDQString String
hi link manSQString String
hi link manBQString String
hi link manBQSQString String
hi link manBullet Special
hi manSubSectionStart term=NONE cterm=NONE gui=NONE ctermfg=black ctermbg=black guifg=navyblue guibg=navyblue
hi manSubSection term=underline cterm=underline gui=underline ctermfg=green guifg=green

set ts=8                                                   

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
colorscheme wuseman.mixed


                                                   

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
set wildmode=list:longest                                                                                                   " Show :e <tab> above eacherother
set formatoptions+=j                                                                                                        " Delete comment characters when joining lines.
set mousehide                                                                                                               " Hide mouse when typing
set ruler

" - Statusline -----------------------------------------------------------------------------------------------------------------------------------------
"
"     For statusline
"
" - --------------------------------------------------------------------------------------------------------------------------------------------------
set statusline=%F%m%r%h%w%=\ [%Y]\ [%{&ff}]\ [%04l,%04v]\ [%p%%]\ [%L]\ [Percent:\ %p%%]\ [col:\ %c\]

                                                   
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
"
" Bash Header (.*sh)
"
au BufNewFile *.sh 0r ~/.vim/headers/bash_header.sh
autocmd bufnewfile *.sh exe "1," . 6 . "g/FileName:.*/s//FileName: " .expand("%")
autocmd bufnewfile *.sh exe "1," . 9 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d (%H:%M:%S)")
autocmd Bufwritepre,filewritepre *.sh exe "1," . 10 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d (%H:%M:%S)")
"
" vimrc configuration (vimrc)
"
autocmd Bufwritepre,filewritepre vimrc exe "1," . 11 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d (%H:%M:%S)")
autocmd Bufwritepre,filewritepre *vimrc exe "1," . 11 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d (%H:%M:%S)")
"
" Configuration files (.conf)
"
au BufNewFile *.conf 0r ~/.vim/headers/config_headers.txt
autocmd bufnewfile *.conf exe "1," . 4 . "g/FileName:.*/s//FileName: " .expand("%")
autocmd bufnewfile *.conf exe "1," . 6 . "g/Created:.*/s//Created: " .strftime("%Y-%m-%d (%H:%M:%S)")
autocmd Bufwritepre,filewritepre *.conf exe "1," . 7 . "g/Modified:.*/s/Modified:.*/Modified: " .strftime("%Y-%m-%d (%H:%M:%S)")

 
                                                

" - Mappings for Bash scripting ---------------------------------------------------------------------------------------------------------------------
"
"    IN this section we store various mappings for make our life easier when we working with shell scripts
"
" - --------------------------------------------------------------------------------------------------------------------------------------------------
nnoremap <leader>bf i<ESC>o<ESC>ofunction editme() {<ESC>o<ESC>o}<ESC>ki<S-TAB>                                                            " Insert a Function 
nnoremap <leader>bg :r /home/wuseman/.vim/bash-templates/getopts.sh<CR>                                                             " Insert getopts example
nnoremap <leader>bu :r /home/wuseman/.vim/bash-templates/usage.sh<CR>                                                             " Insert getopts exampleS
nnoremap <leader>bs :r /home/wuseman/.vim/bash-templates/settings.sh<CR>                                                             " Insert getopts exampleS
nnoremap <leader>bi :r /home/wuseman/.vim/bash-templates/if.sh<CR>                                                             " Insert getopts exampleS
nnoremap <leader>bgl :r /home/wuseman/.vim/bash-templates/getopts-long.sh<CR>                                                             " Insert getopts exampleS

" - Mappings  ------------------------------------------------------------------------------------------------------------------------------------------
"
"    map is the "root" of all recursive mapping commands. The root form applies to "normal", "visual+select", and "operator-pending" modes.
"    noremap is the "root" of all non-recursive mapping commands. The root form applies to the same modes as map. (Think of the nore prefix to mean "non-recursive".)
"
"    (Note that there are also the ! modes like map! that apply to insert & command-line.)
"
"    We keep it clean and simple with minimal descriptions for help
"
" :nmap - Display normal mode maps
" :imap - Display insert mode maps
" :vmap - Display visual and select mode maps
" :smap - Display select mode maps
" :xmap - Display visual mode maps
" :cmap - Display command-line mode maps
" :omap - Display operator pending mode maps"
"
"
" - -----------------------------------------------------------------------------------------------------------------------------------------------------
nnoremap - $                                                                                                                        " Home & End should be placed next to each other
nnoremap <leader>n :set number!<CR>                                                                                                 " Hit ,n for toggle showing numbers
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
noremap 0 g0
noremap $ A 
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

" Send current buffer the default printer with -p.
nnoremap <leader>p :hardcopy<CR>

" Easy bracket creation.
inoremap <leader>' ''<esc>i
inoremap <leader>" ""<esc>i
inoremap <leader>( ()<esc>i
inoremap <leader>[ []<esc>i
inoremap <leader>{ {}<esc>i

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Paste yanked line without line breaks before/after cursor position
nnoremap gp i<CR><Esc>PkJxJx
nnoremap gp a<CR><Esc>PkJxJx

                                                " Delete current line without yanking the line breaks 
nnoremap dil d$

" -  Copy / Paste / Cut ---------------------------------------------------------------------------------------------------------------------------------
"
"     Copy and paste to your clipboard on a linux machine, this require vim-gtk(3)
""
" - -----------------------------------------------------------------------------------------------------------------------------------------------------
set clipboard=unnamed                                                                                                               " For set paste method
map <leader>P "+y                                                                                                                   " Use ,P for copy to linux clipboard, this require vim-gtk3
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>


                                                

" - Mappings for bash scripting ----------------------------------------------------------------------------------------------------------------------
"
"    For make our life easier in cli
"
" - --------------------------------------------------------------------------------------------------------------------------------------------------
nnoremap <leader>bf i<ESC>o<ESC>ofunction editme() {<ESC>o<ESC>o}<ESC>ki<S-TAB>                                                            " Insert a function example   
nnoremap <leader>bg :r /home/wuseman/.vim/bash-templates/getopts.sh<CR>
nnoremap <leader>bu :r /home/wuseman/.vim/bash-templates/usage.sh<CR>
nnoremap <leader>bs :r /home/wuseman/.vim/bash-templates/settings.sh<CR>
nnoremap <leader>bi :r /home/wuseman/.vim/bash-templates/if.sh<CR> 


                                                

" - Autocmd ------------------------------------------------------------------------------------------------------------------------------------
"
"    Uncomment the following to have Vim load indentation rules and plugins according to the detected filetype.
"
" - ----------------------------------------------------------------------------------------------------------------------------------------------------- 
filetype indent on
set smartindent
autocmd BufRead,BufWritePre *.sh normal gg=G


                                                

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


" Change line below cursor and pres ... for edit 
nnoremap <Leader>q *``cgn
nnoremap <Leader>Q #``cgN


" Cursor only active in current window
augroup Cursoractive
    au!
    autocmd VimEnter, WinEnter, BufWinEnter * set local cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END


" Select word and replace all words
nnoremap <Leader>rs :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <expr> <leader>rw ':<c-u>%s/\<' . expand('<cword>') . '\>//g<left><left>'
nnoremap <expr> <leader>rr ':<c-u>%s///g<left><left>'



" - Explorer / Netrw -------------------------------------------------------------------------------------------------------------------------------------
"
" http://www.drchip.org/astronaut/vim/index.html#NETRW
" https://thefrugalcomputerguy.com/linux/grouppg.php?ser=10002&grp=10
"
" - -----------------------------------------------------------------------------------------------------------------------------------------------------

"Map F5 to toggle on and off the line numbers in Normal mode
nmap <F5> gh

" These next 2 lines will hide the dot files on startup
let ghregex='\(^\|\s\s\)\zs\.\S\+'    
let g:netrw_list_hide=ghregex        

"Map F6 to toggle on and off the banner
nmap <F6> I

"#Turn off the banner at the top of the sreen on startup
let g:netrw_banner=0    

"# to change the way netrw shows the files and directorys
"let g:netrw_liststyle= 0    " Default view (directory name/file name)
"let g:netrw_liststyle= 1    " Show time and size
"let g:netrw_liststyle= 2    " Shows listing in 2 columns
let g:netrw_liststyle= 3    " show the tree listing


"# Set the split windows to always be equal and open splits to the right
let g:netrw_winsize = 0         "   set default window size to be always equal
let g:netrw_preview = 1		    "	 open splits to the right



let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 2
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1


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


" Quickly edit/reload this configuration file

nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>
