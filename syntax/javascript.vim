" Vim syntax file
" Language:	JavaScript
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" Updaters:	Scott Shattuck (ss) <ss@technicalpursuit.com>
" URL:		http://www.fleiner.com/vim/syntax/javascript.vim
" Changes:	(ss) added keywords, reserved words, and other identifiers
"		(ss) repaired several quoting and grouping glitches
"		(ss) fixed regex parsing issue with multiple qualifiers [gi]
"		(ss) additional factoring of keywords, globals, and members
" Last Change:	2010 Mar 25

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
" tuning parameters:
" unlet javaScript_fold

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("javaScript_fold")
  unlet javaScript_fold
endif



syn match   javascriptNormal           "\."
syn keyword javaScriptCommentTodo      TODO FIXME XXX TBD FIX contained
syn match   javaScriptDocMethod        "#[^ }]\+" contained
syn match   javaScriptDocFlag          "[?:=]" contained contains=javaScriptNumber,javaScriptStringS,javaScriptStringD
syn match   javaScriptDocTypes         "{[^}]\+}" contained contains=javaScriptDocFlag,javaScriptDocMethod
syn match   javaScriptDocVar           "@[a-zA-Z_\.]\+" contained
syn match   javaScriptDocTag           "#[^ (#]\+([^)]\+)\|#[^ (#]\+" contained contains=javaScriptDocTypes,javaScriptDocVar,javaScriptStringS,javaScriptStringD,javaScriptNumber,javaScriptNormal

syn match   javaScriptSpecial	       "\\\d\d\d\|\\."
syn region  javaScriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=javaScriptSpecial,@htmlPreproc
syn region  javaScriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=javaScriptSpecial,@htmlPreproc
syn match   javaScriptNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>" 
syn match   javaScriptSpecialCharacter "'\\.'"

syn match   javaScriptLineComment      "\/\/.*" contains=@Spell,javaScriptCommentTodo,javaScriptDocInfo
syn match   javaScriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  javaScriptComment	       start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo,javaScriptDocTypes,javaScriptDocVar,javaScriptDocTag

syn region  javaScriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword javaScriptNode              require
syn keyword javaScriptConditional	if else switch
syn keyword javaScriptRepeat		while for do in
syn keyword javaScriptBranch		break continue
syn keyword javaScriptOperator		new delete instanceof typeof
syn keyword javaScriptType		Array Boolean Date Function Number Object String RegExp Error Math
syn keyword javaScriptStatement		return with
syn keyword javaScriptBoolean		true false
syn keyword javaScriptNull		null undefined
syn keyword javaScriptIdentifier	arguments this var that self
syn keyword javaScriptLabel		case default
syn keyword javaScriptException		try catch finally throw
syn keyword javaScriptMessage		alert confirm prompt status
syn keyword javaScriptGlobal		global window assert
syn keyword javaScriptMember		location prototype constructor toString call apply hasOwnProperty setTimeout clearTimeout setInterval clearInterval isNaN
syn keyword javaScriptReserved		abstract boolean byte char class const debugger double enum export extends final float goto implements import int interface long native package private protected public short static super synchronized throws transient volatile 

if exists("javaScript_fold")
    syn match	javaScriptFunction	"\<function\>"
    syn region	javaScriptFunctionFold	start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match javaScriptSync	grouphere javaScriptFunctionFold "\<function\>"
    syn sync match javaScriptSync	grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword javaScriptFunction	function
    syn match	javaScriptBraces	   "[{}\[\]]"
    syn match	javaScriptParens	   "[()]"
endif

syn sync fromstart
syn sync maxlines=100

if main_syntax == "javascript"
  syn sync ccomment javaScriptComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink javaScriptNormal                 Normal 
  HiLink javaScriptNode                 Function 
  HiLink javaScriptComment		Comment
  HiLink javaScriptLineComment		Comment
  HiLink javaScriptCommentTodo		Todo
  HiLink javaScriptDocVar		Member
  HiLink javaScriptDocTypes		Type
  HiLink javaScriptDocMethod		Keyword
  HiLink javaScriptDocFlag		Keyword
  HiLink javaScriptDocTag		Identifier
  HiLink javaScriptSpecial		Special
  HiLink javaScriptStringS		String
  HiLink javaScriptStringD		String
  HiLink javaScriptCharacter		Character
  HiLink javaScriptSpecialCharacter	Special
  HiLink javaScriptNumber		Number
  HiLink javaScriptConditional		Conditional
  HiLink javaScriptRepeat		Repeat
  HiLink javaScriptBranch		Conditional
  HiLink javaScriptOperator		Operator
  HiLink javaScriptType			Type
  HiLink javaScriptStatement		Conditional
  HiLink javaScriptFunction		Function
  HiLink javaScriptBraces		Function
  HiLink javaScriptError		Error
  HiLink javaScrParenError		Error 
  HiLink javaScriptNull			Number  
  HiLink javaScriptBoolean		Boolean  
  HiLink javaScriptRegexpString		String

  HiLink javaScriptIdentifier		Identifier
  HiLink javaScriptLabel		Label
  HiLink javaScriptException		Exception
  HiLink javaScriptMessage		Keyword
  HiLink javaScriptGlobal		Keyword
  HiLink javaScriptMember		Member 
  HiLink javaScriptDeprecated		Exception 
  HiLink javaScriptReserved		Keyword
  HiLink javaScriptDebug		Debug
  HiLink javaScriptConstant		Label

  delcommand HiLink
endif

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif

" vim: ts=8
