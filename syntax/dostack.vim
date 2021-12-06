if exists("b:current_syntax")
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

syn match DoStackComment "//.*$"
syn keyword DoStackTodo TODO 
syn keyword DoStackDone DONE 
syn keyword DoStackDaily DAILY

syntax sync fromstart

" Highlighting
hi def link DoStackComment Comment
hi def link DoStackTodo Special
hi def link DoStackDone Special
hi def link DoStackDaily Special

let b:current_syntax = "todos"

let &cpo = s:save_cpo
unlet! s:save_cpo
