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

syntax keyword skillConditional caseq cond if then else when unless 

syntax keyword skillKeywords begin declare declareN declareSQN declareLambda defmacro 
            \ defprop defstruct defun define defUserInitProc 
            \ defvar lambda last let letseq letrec 
            \ list procedure prog return

syntax keyword skillRepeat go for forall foreach while 

syntax keyword skillFunction abs acos cos add1 addDefstructClass alias alphalessp alphaNumCmp 
            \ append1 apply arrayp arrayref asin sin assoc assq assv atan tan atom
            \ bcdp booleanp boundp buildString ceiling changeWorkingDir 
            \ caaaar caaadr caadar caaddr caar cddaar cddadr cdddar cddddr
            \ caddar cadddr cadr cdaaar cdaadr cdaar cdadar cdaddr cdadr cdar 
            \ cddaar cddadr cddar cdddar cddddr cdddr cddr caaar caadr cadar 
            \ caddr cdadr cadaar cadadr caddar cadddr cdaaar cdaadr cdadar cdaddr 
            \ charToInt clearExitProcs close compareTime compress concat cons copy 
            \ copyDefstructDeep createDir csh defstructp delete deleteDir deleteFile display 
            \ drain dtpr edit envobj equal eqv err error errset errsetstring 
            \ eval evalstring evenp exists exit exp expandMacro file
            \ fileLength fileSeek fileTell fileTimeModified
            \ fixp floatp floor printf fprintf sprintf scanf fscanf funobj gc gensym 
            \ get get_pname get_string
            \ getc getchar getCurrentTime getd getDirFiles getFnWriteProtect getRunType getInstallPath 
            \ getqq getq gets getShellEnvVar getSkill getSkillPath getSkillVersion 
            \ getVarWriteProtect getVersion getWarn 
            \ getWorkingDir index infile inportp inScheme inSkill instring integerp intToChar
            \ isCallable isDir isExecutable isFile isFileEncrypted isFileName isLink
            \ isMacro isWritable lconc length lineread readstring listp listToVector 
            \ loadi load loadstring log lowerCase makeTable makeTempFileName makeVector 
            \ map mapcar mapcan maplist
            \ max measureTime member memq memv min minusp mod nconc ncons needNCells 
            \ negativep neq nequal newline nindex not nth nthcdr nthelem null numberp 
            \ numOpenFiles oddp onep otherp outfile outportp pairp parseString plist 
            \ plusp portp p\=print prependInstallPath println procedurep putd putpropq putpropqq
            \ random read readString readTable realp regExitAfter regExitBefore remainder remdq remd remExitProc 
            \ remove remprop remq reverse rexCompile rexExecute rexMagic rexMatchAssocList rexMatchList 
            \ rexMatchp rexReplace rexSubstitute rindex round rplacad schemeTopLevelEnv set setq setSGq setSG
            \ setarray setcdr setcadr setFnWriteProtect setof setplist setShellEnvVar setSkillPath 
            \ setVarWriteProtect sh shell simplifyFilename sort sortcar sqrt srandom sstatus 
            \ strn strncat strncmp stringp stringToFunction stringToSymbol stringToTime strlen sub1 subst 
            \ substring sxtd symbolp symbolToString symeval symstrp system tablep tableToList 
            \ tailp tconc timeToString timeToTm tmToTime truncate typep unalias upperCase 
            \ vector vectorToList warn write writeTable xcons zerop zxtd 

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

syn match   skillVarArg             "\c@\{1,2}[a-z0-9?!\-_+*.=<>#$]\+\(/[a-z0-9?!\-_+*.=<>#$]\+\)\?"
syn match   skillSymbol             "\c['`]\{1,2}[a-z0-9?!\-_+*.=<>#$]\+\(/[a-z0-9?!\-_+*.=<>#$]\+\)\?"
syn match   skillArrow              "\c->\{1,2}[a-z0-9?!\-_+*.=<>#$]\+\(/[a-z0-9?!\-_+*.=<>#$]\+\)\?"
syn match   skillSquiggle           "\c~>\{1,2}[a-z0-9?!\-_+*.=<>#$]\+\(/[a-z0-9?!\-_+*.=<>#$]\+\)\?"

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
hi def link skillVarArg         Operator
hi def link skillSymbol         Operator
hi def link skillArrow          Operator
hi def link skillSquiggle       Operator
hi def link skillAccess         Constant
hi def link skillFunction		Function
hi def link skillKeywords		Function
hi def link skillConditional	Conditional
hi def link skillRepeat			Repeat
hi def link skillString			String
hi def link skillNumber			Number
hi def link skillTodo			Todo
hi def link skillNote			Todo
hi def link skillComment		Comment
hi def link skillCommentError	Error

let b:current_syntax = "skill"
