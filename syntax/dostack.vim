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
syn match DoStackDate "[0-3]\=[0-9]-[0-1]\=[0-9]-\d\d\d\d"

syn keyword DoStackTodo TODO 
syn keyword DoStackDone DONE 
syn keyword DoStackDaily DAILY
syn keyword DoStackIdea IDEA
syn keyword DoStackImportant Important 

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
hi def link DoStackDate markdownId

hi def link DoStackTodo Special
hi def link DoStackDone Special
hi def link DoStackDaily Special
hi def link DoStackIdea Special
hi def link DoStackImportant Special

let b:current_syntax = "todos"

let &cpo = s:save_cpo
unlet! s:save_cpo
