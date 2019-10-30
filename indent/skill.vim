" Vim indent file
" Language:    SKILL / SKILL++
" Maintainer:  Yannick Uhlmann <ynk2401@gmail.com>
" URL:         https://github.com/augustunderground/vim-skill
" Last Change: 2019-10-30
"
" Based on the Lisp indent file by Sergey Khorev (<sergey.khorev@gmail.com>), 
" http://sites.google.com/site/khorser/opensource/vim
" and the hy indent file by Gregor Best Gregor Best (<gbe@unobtanium.de>),
" https://github.com/hylang/vim-hy

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif

let b:did_indent = 1
let b:undo_indent = "setl ai< si< et< lw< lisp<"

setlocal ai nosi nolisp
setlocal softtabstop=4 shiftwidth=4 expandtab

setlocal iskeyword+=-,?,!,=,>,*,/,.

" skillConstant
setlocal lispwords+=nil,not

" skillBoolean
setlocal lispwords+=,nil,t

" skillSpecial
setlocal lispwords+=,let,letseq,letrec,set,setq,setf,setSG,lambda

" skillException
setlocal lispwords+=,else,then,catch,case,caseq,exists,existss,throw

" skillCond
setlocal lispwords+=,cond,if,when,unless

" skillRepeat
setlocal lispwords+=,loop,for,fors,foreach,foreachs,forall,foralls
setlocal lispwords+=,while,map,mapc,mapcan,mapcar,mapcon,mapinto,maplist
setlocal lispwords+=,go,do,setof,setofs

" skillDefine
setlocal lispwords+=alias,makeTable,makeVector
setlocal lispwords+=def,define,defvar,defun,defstruct,defprop,defclass,defmacro

" skillFunc
setlocal lispwords+=,!=,%,%=,&,&=,*,+,+=,\,-,-=,.,/
setlocal lispwords+=,//,//=,/=,<,<<,<<=,<=,=,>,>=,>>,>>=,&&,||,-\>,~\>

setlocal lispwords+=,break,return,car,cadr,symbol
setlocal lispwords+=,print
