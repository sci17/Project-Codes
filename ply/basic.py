import ply.lex as lex
import ply.yacc as yacc


tokens = [
    'int'
    'float'
    'name'
    'and'
    'or'
    'not'
    'rparen'
    'lparen'
]

tt_and = r'\&'
tt_or = r'\|'
tt_not = r'\~'
tt_rparen = r'\)'
tt_lparen = r'\('

tt_ignore = r' '

def tt_int(t):
    r'\d+'
    t.value = int(t.value)
    return t

def tt_float(t):
    r'\d+\.\d+'
    t.value =float(t.value)
    return t

def tt_name(t):
     r'[a-zA-Z_][a-zA-Z_0-9]*'
     t.type = 'name'
     return t

def tt_Error(t):
    print('Illegal Character')
    t.lexer.skip(1)

lexer = lex.lex()

lexer.input('1+2')

while True:
    tok = lexer.token()
    if not tok:
        break
    print(tok)







