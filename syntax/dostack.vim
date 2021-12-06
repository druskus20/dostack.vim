if exists("b:current_syntax")
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

syn match DoStackComment "^//.*$"

syn match DoStackHeader1 "^#.*$"
syn match DoStackHeader2 "^##.*$"
syn match DoStackHeader3 "^###.*$"
syn match DoStackHeader4 "^####.*$"
syn match DoStackHeader5 "^#####.*$"
syn match DoStackHeader6 "^######.*$"

syn match DoStackUrl /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/
syn match DoStackTag "@\w\+"
syn match DoStackImportant "!important"

syn region DoStackStrong start="*" end="*"
syn match DoStackListMarker "\%(\t\| \{0,4\}\)[-*+]\%(\s\+\S\)\@=" 
syn match DoStackOrderedListMarker "\%(\t\| \{0,4}\)\<\d\+\.\%(\s\+\S\)\@=" 


"" Cell
syn keyword DoStackTodo contained TODO
syn keyword DoStackDone contained DONE 
syn keyword DoStackIdea contained IDEA
syn keyword DoStackWip contained WIP
syn keyword DoStackDaily contained DAILY
syn keyword DoStackWeekly contained WEEKLY
syn keyword DoStackMonthly contained MONTHLY
syn cluster DoStackCellType contains=DoStackTodo,DoStackDone,DoStackIdea,DoStackWip,DoStackDaily,DoStackWeekly,DoStackMonthly

syn match DoStackDate "[0-3]\=[0-9]-[0-1]\=[0-9]-\d\d\d\d"

syn region DoStackCell start="\[" end="\]" contains=@DoStackCellType,DoStackDate

syntax sync fromstart

" Highlighting
hi def link DoStackComment Comment
hi DoStackHeader1 gui=bold guifg=#e1e1ef
hi def link DoStackHeader2 doStackHeader1
hi def link DoStackHeader3 doStackHeader1
hi def link DoStackHeader4 doStackHeader1
hi def link DoStackHeader5 doStackHeader1
hi def link DoStackHeader6 doStackHeader1

hi DoStackUrl gui=underline guifg=#a3a3a8
hi DoStackTag guifg=#7e848f
hi DoStackImportant gui=bold,italic guifg=#e1bee9

hi DoStackStrong gui=bold
hi DoStackListMarker guifg=#7e848f
hi DoStackOrderedListMarker guifg=#7e848f 

"" Cell
hi DoStackTodo guifg=#eca8a8 gui=bold
hi DoStackDone guifg=#ccd389 gui=bold
hi DoStackIdea guifg=#a5c6e1 gui=bold
hi DoStackWip guifg=#efd5a0 gui=bold
hi DoStackDaily guifg=#c7ebe6 gui=bold
hi DoStackWeekly guifg=#c7ebe6 gui=bold
hi DoStackMonthly guifg=#c7ebe6 gui=bold

hi DoStackDate gui=bold guifg=#e1bee9

hi DoStackCell guifg=#7e848f

let b:current_syntax = "todos"

let &cpo = s:save_cpo
unlet! s:save_cpo
