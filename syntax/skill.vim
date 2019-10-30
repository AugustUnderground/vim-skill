" Vim syntax file
" Language:     SKILL / SKILL ++
" License:      Same as VIM
" Authors:      Yannick Uhlmann <ynk2401@gmail.com>
" URL:          http://github.com/augustunderground/vim-skill
"
" Based on Morten Linderud's (mcfoxax@gmail.com) and Alejandro Gómez's (alejandro@dialelo.com)
" Syntax file for Hy: http://github.com/hylang/vim-hy
" And the basic SKILL syntax file included with vim by Toby Schaffer (jtschaff@eos.ncsu.edu)

if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "skill"

syn keyword skillConstants t nil unbound

" enumerate all the SKILL reserved words/functions

syntax keyword skillConditional caseq\= cond if then else when unless 

syntax keyword skillKeywords begin declare declare\(N\|SQN\)\=Lambda defmacro 
            \ defprop defstruct defun define defUserInitProc 
            \ defvar lambda last let letseq letrec 
            \ list procedure prog return

syntax keyword skillRepeat go for\(all\|each) while 

syntax keyword skillFunction abs a\=cos add1 addDefstructClass alias alphalessp alphaNumCmp 
            \ append1\= apply arrayp arrayref a\=sin assoc ass[qv] a\=tan ato[fim] 
            \ bcdp booleanp boundp buildString c[ad]{1,3}r ceiling changeWorkingDir 
            \ charToInt clearExitProcs close compareTime compress concat cons copy 
            \ copyDefstructDeep createDir csh defstructp delete\(Dir\|File\) display 
            \ drain dtpr ed\(i\|l\|it\)\= envobj equal eqv\= err error errset errsetstring 
            \ eval evalstring evenp exists exit exp expandMacro file\(Length\|Seek\|Tell\|TimeModified\) 
            \ fixp\= floatp\= floor [fs]\=printf f\=scanf funobj gc gensym get\(_pname\|_string\)\= 
            \ getc\(har\)\= getCurrentTime getd getDirFiles getFnWriteProtect getRunType getInstallPath 
            \ getqq\= gets getShellEnvVar getSkill\(Path\|Version\) getVarWriteProtect getVersion getWarn 
            \ getWorkingDir index infile inportp in\(Scheme\|Skill\) instring integerp intToChar is
            \ \(Callable\|Dir\|Executable\|File\|FileEncrypted\|FileName\|Link
            \ \|Macro\|Writable\) lconc length lineread\(string\)\= listp listToVector 
            \ loadi\= loadstring log lowerCase makeTable makeTempFileName makeVector map\(c\|can\|car\|list\) 
            \ max measureTime member mem[qv] min minusp mod \(ulo\)\= ncon[cs] needNCells 
            \ negativep neq\(ual\)\= newline nindex not nth\(cdr\|elem\)\= null numberp 
            \ numOpenFiles oddp onep otherp outfile outportp pairp parseString plist 
            \ plusp portp p\=print prependInstallPath printl\(ev\|n\) procedurep putd putpropq\{,2} 
            \ random read readString readTable realp regExit\(After\|Before\) remainder remdq\= remExitProc 
            \ remove remprop remq reverse rexCompile rexExecute rexMagic rexMatchAssocList rexMatchList 
            \ rexMatchp rexReplace rexSubstitute rindex round rplac[ad] schemeTopLevelEnv set 
            \ setarray setc[ad]r setFnWriteProtect setof setplist setq setShellEnvVar setSkillPath 
            \ setVarWriteProtect sh\(ell\)\= simplifyFilename sort\(car\)\= sqrt srandom sstatus 
            \ strn\=cat strn\=cmp stringp stringTo\(Function\|Symbol\|Time\) strlen sub1 subst 
            \ substring sxtd symbolp symbolToString symeval symstrp system tablep tableToList 
            \ tailp tconc timeToString timeToTm tmToTime truncate typep\= unalias upperCase 
            \ vector\(ToList\)\= warn write writeTable xcons zerop zxtd 

" DFII procedural interface routines

" CDF functions
syn match skillcdfFunctions			"(cdf\u\a\+\>"hs=s+1
" graphic editor functions
syn match skillgeFunctions			"(ge\u\a\+\>"hs=s+1
" human interface functions
syn match skillhiFunctions			"(hi\u\a\+\>"hs=s+1
" layout editor functions
syn match skillleFunctions			"(le\u\a\+\>"hs=s+1
" database|design editor|design flow functions
syn match skilldbefFunctions		"(d[bef]\u\a\+\>"hs=s+1
" design management & design data services functions
syn match skillddFunctions			"(dd[s]\=\u\a\+\>"hs=s+1
" parameterized cell functions
syn match skillpcFunctions			"(pc\u\a\+\>"hs=s+1
" tech file functions
syn match skilltechFunctions		"(\(tech\|tc\)\u\a\+\>"hs=s+1

" strings
syn region skillString				start=+"+ skip=+\\"+ end=+"+

syn keyword skillTodo contained		TODO FIXME XXX
syn keyword skillNote contained		NOTE IMPORTANT

" comments are either C-style or begin with a semicolon
syn region skillComment				start="/\*" end="\*/" contains=skillTodo,skillNote
syn match skillComment				";.*" contains=skillTodo,skillNote
syn match skillCommentError			"\*/"

syntax match skillNumber            "\v<[-+]?%(0\o*|0x\x+|[1-9]\d*)N?>"
syntax match skillNumber            "\v<[-+]?%(0|[1-9]\d*|%(0|[1-9]\d*)\.\d*)%(M|[eE][-+]?\d+)?>"
syntax match skillNumber            "\v<[-+]?%(0|[1-9]\d*)/%(0|[1-9]\d*)>"

syntax match skillVarArg            "@"

syntax match skillQuote             "'"
syntax match skillQuote             "`"
syntax match skillAccess            "\~>"
syntax match skillAccess            "\->"

syn sync ccomment skillComment minlines=10

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link skillcdfFunctions	Function
hi def link skillgeFunctions    Function
hi def link skillhiFunctions    Function
hi def link skillleFunctions    Function
hi def link skilldbefFunctions	Function
hi def link skillddFunctions	Function
hi def link skillpcFunction		Function
hi def link skilltechFunctions	Function
hi def link skillConstants		Constant
hi def link skillQuote          Constant
hi def link skillAccess         Constant
hi def link skillFunction		Function
hi def link skillKeywords		Function
hi def link skillConditional	Conditional
hi def link skillRepeat			Repeat
hi def link skillString			String
hi def link skillTodo			Todo
hi def link skillNote			Todo
hi def link skillComment		Comment
hi def link skillCommentError	Error

let b:current_syntax = "skill"
