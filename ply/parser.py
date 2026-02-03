import ply.lex as lex
import ply.yacc as yacc
import sys


#Tokens
tokens = (
    "AND",
    "OR",
    "NOT",
    "LPAREN",
    "RPAREN",
    "VAR",
    "ONE",
    "ZERO",
    "PLUS"

)

#regular expressions
t_AND = r'&'
t_OR = r'\|'
t_NOT = r'~'
t_LPAREN = r'\('
t_RPAREN = r'\)'
t_ONE = r'1'
t_ZERO = r'0'
t_PLUS = r'\+'


t_ignore = r' '

#tokenName
def t_VAR(t):
    r'[a-zA-Z_][a-zA-Z_0-9]*'
    t.type = 'VAR'
    return t

# #LineCount
# def t_newline(t):
#     r'\n+'
#     t.lexer.lineno += len(t.value)

#error
def t_error(t):
    print(f"Illegal Character '{t.value[0]}'")
    t.lexer.skip(1)

#lexer
lexer = lex.lex()


#PARSER
#Precedence rules
precedence = (
    ('left', 'OR'),
    ('left', 'AND'),
    ('right', 'NOT')
)

def p_calc(p):
    '''
    calc : expression
         | term
    '''
    print(run(p[1]))

#GrammarRules
def p_expression_or(p):
    '''
    expression : expression OR term
               | term
    '''
    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = ('or', p[1], p[3])

def p_term_and(p):
    '''
    term : term AND factor
         | factor
    '''
    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = ('and', p[1], p[3])

def p_factor_not(p):
    '''
    factor : NOT factor
           | primary
    '''
    if len(p) == 3:
        p[0] = ('not', p[2])
    else:
        p[0] = p[1]

def p_primary(p):
    '''
    primary : LPAREN expression RPAREN
            | VAR
    '''
    if len(p) == 4:
        p[0] = p[2]
    else:
        p[0] = p[1]

#ErrorHandling
def p_error(p):
    print("Syntax error")

#Build Parser
parser = yacc.yacc()

def run(p):
    if type(p) == tuple:
        if p[0] == 'or':
            left_expr = run(p[1])
            right_expr = run(p[2])
            return f"({left_expr} OR {right_expr})"
        elif p[0] == 'and':
            left_expr = run(p[1])
            right_expr = run(p[2])
            return f"({left_expr} AND {right_expr})"
        elif p[0] == 'not':
            inner_expr = run(p[1])
            return f"(NOT {inner_expr})"
        elif None in p:
            for i in p:
                if i not in (None, '~', '&', '+', '|'):
                    return run(i)

                # else:
                #
                #     if p[0] == '&':
                #         if p[1] == '1':
                #             print('Identity Law')
                #             if p[2] != tuple:
                #                 return run(p[2])
                #             else:
                #                 return run(p[2][1], p[2][0], p[2][2])
                #
                #         elif p[1][0] == '&' and (p[1][1] == p[2] or p[1][2] == p[2]):
                #             print("Absorption")
                #             return p[2]
                #         elif p[2][0] == '&' and (p[2][1] == p[1] or p[2][2] == p[1]):
                #             print("Absorption")
                #             return run(p[1])
                #         elif p[1] == p[2]:
                #             print("Idempotent Law")
                #             return run(p[1])

    else:
        return p



while True:
    try:
        s = input ('>>')
    except EOFError:
        break
    result = parser.parse(s)
    formatted_expression = run(result)
    print("Formatted Boolean Expression:", formatted_expression)



# while True:
#     try:
#         s = input ('>>')
#     except EOFError:
#         break
#     parser.parse(s)