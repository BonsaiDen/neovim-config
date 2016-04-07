" gbasm - syntax
" 2014 Ivo Wetzel
" http://github.com/BonsaiDen/gbasm
syn clear
syn case ignore

syn keyword gb_instruction  adc add and bit ccf cp cpl daa dec di ei ex halt inc ld ldd ldi ldh ldio nop or pop push res reti rl rla rlc rlca rr rra rrc rrca rst sbc scf set sla sra srl stop sub swap xor res
syn keyword gb_register     a b c d e h l af bc de hl sp hld hli 
syn keyword gb_branch       jr jp call
syn keyword gb_return       ret 

syn match gb_label          "^[a-z_][a-z0-9_]*:"he=e-1
syn match gb_localLabel     "^\.[a-z_][a-z0-9_]*:"he=e-1
syn match gb_indentifier    "[a-z_][a-z0-9_]*"
syn match gb_macroArg       "@[a-z_][a-z0-9_]*"
syn match gb_condition      "\(\sc\|nc\|\sz\|nz\),\s*\(\.\|@\|[a-z0-9_]\{2,}\)"me=s+2
syn match gb_condition2     "\(\sc\|nc\|\sz\|nz\)$"
syn match gb_condition3     "\(\sc\|nc\|\sz\|nz\)\s*;"me=e-1
                            
syn match gb_comment        ";.*" contains=gb_todos
syn region gb_string        start=+"+ skip=+\\"+ end=+"+

syn keyword gb_todos        contained todo fixme xxx warning danger notice bug
syn keyword gb_macro        strupr strlwr strsub strin stpadr strpadl sin cos tan asin acos atan2 log exp floor ceil round sqrt max min abs rand macro endmacro section db dw ds
                            
syn match gb_fixedNumber    "\d\\+.\d\+\>"
syn match gb_hexNumber	    "\$[0-9a-f][0-9a-f_]*\>"
syn match gb_decNumber	    "[0-9][0-9_]*\>"
syn match gb_binNumber	    "%[0-1][0-1_]*\>"


if !exists("gbasm_syntax_init")
    let gbasm_syntax_init = 1

    hi link gb_label       Label
    hi link gb_localLabel  Label
                        
    hi link gb_string      String
    hi link gb_comment     Comment
    hi link gb_instruction Statement
    hi link gb_branch      Statement
    hi link gb_return      Function
    hi link gb_register    Identifier
    hi link gb_todos       Todo
    hi link gb_macroArg    Identifier
    hi link gb_macro       Function
    hi link gb_condition   Function
    hi link gb_condition2  Function
    hi link gb_condition3  Function

    hi link gb_fixedNumber Number
    hi link gb_hexNumber   Number
    hi link gb_decNumber   Number
    hi link gb_binNumber   Number
            
endif

let b:current_syntax = "gbasm"

