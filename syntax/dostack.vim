if exists("b:current_syntax")
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

syn match DoStackComment "^//.*$"

syn match DoStackHeader1 "^#.*$"
syn match DoStackHeader2 "^##.*$"
syn match DoStackHeader3 "^###.*$"
syn match DoStackHeader4 "^#.*$"
syn match DoStackHeader5 "^##.*$"
syn match DoStackHeader6 "^###.*$"

syn match DoStackUrl /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/
syn match DoStackTag "@\w\+"
syn match DoStackImportant "!IMPORTANT"

syn region DoStackStrong start="*" end="*"
syn match DoStackListMarker "\%(\t\| \{0,4\}\)[-*+]\%(\s\+\S\)\@=" 
syn match DoStackOrderedListMarker "\%(\t\| \{0,4}\)\<\d\+\.\%(\s\+\S\)\@=" 


"" Cell
syn keyword DoStackTodo contained TODO
syn keyword DoStackDone contained DONE 
syn keyword DoStackIdea contained IDEA
syn keyword DoStackDaily contained DAILY
syn keyword DoStackWeekly contained WEEKLY
syn keyword DoStackMonthly contained MONTHLY
syn cluster DoStackCellType contains=DoStackTodo,DoStackDone,DoStackIdea,DoStackDaily,DoStackWeekly,DoStackMonthly

syn match DoStackDate contained "[0-3]\=[0-9]-[0-1]\=[0-9]-\d\d\d\d"

syn region DoStackCell start="\[" end="\]" contains=@DoStackCellType,DoStackDate

syntax sync fromstart

" Highlighting
hi def link DoStackComment Comment
hi def link DoStackHeader1 markdownH1
hi def link DoStackHeader2 markdownH2
hi def link DoStackHeader3 markdownH3
hi def link DoStackHeader4 markdownH4
hi def link DoStackHeader5 markdownH5
hi def link DoStackHeader6 markdownH6

hi def link DoStackUrl markdownUrl
hi def link DoStackTag markdownRule
hi def link DoStackImportant Special

hi def link DoStackStrong markdownBold
hi def link DoStackListMarker markdownListMarker     
hi def link DoStackOrderedListMarker markdownOrderedListMarker     

"" Cell
hi def link DoStackTodo Special
hi def link DoStackDone Special
hi def link DoStackIdea Special
hi def link DoStackDaily Special
hi def link DoStackWeekly Special
hi def link DoStackMonthly Special

hi def link DoStackDate markdownId

hi def link DoStackCell markdownRule

let b:current_syntax = "todos"

let &cpo = s:save_cpo
unlet! s:save_cpo
