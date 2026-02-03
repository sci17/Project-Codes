import ply.lex as lex
import ply.yacc as yacc

# Tokens
tokens = (
    "AND",
    "OR",
    "NOT",
    "LPAREN",
    "RPAREN",
    "VAR",
)

# Regular expressions for tokens
t_AND = r'&'
t_OR = r'\|'
t_NOT = r'~'
t_LPAREN = r'\('
t_RPAREN = r'\)'
t_VAR = r'[a-zA-Z_][a-zA-Z_0-9]*'

# ignore whitespace characters when we are tokenizing an input
t_ignore = ' \t\n'


# this line is for handling some errors that you can encounter when tokenizing
def t_error(t):
    print(f"Illegal character '{t.value[0]}'")
    t.lexer.skip(1)

# for constructing a lexer
lexer = lex.lex()

# Precedence rules
precedence = (
    ('left', 'OR'),
    ('left', 'AND'),
    ('right', 'NOT')
)

# Grammar rules
# this line is for the parsing of grammar; the parse result will be stored at the p[0]
def p_calc(p):
    '''
    calc : expression
         | term
    '''
    p[0] = p[1]

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

def p_error(p):
    print("Syntax error in input!")

parser = yacc.yacc()

def run(p):
    if type(p) == tuple:
        if p[0] == 'or':
            left_expr = run(p[1])
            right_expr = run(p[2])
            return left_expr or right_expr
        elif p[0] == 'and':
            left_expr = run(p[1])
            right_expr = run(p[2])
            return left_expr and right_expr
        elif p[0] == 'not':
            inner_expr = run(p[1])
            return not inner_expr
    else:
        return p
# extracting the operators from the tuples
def format_expression(p):
    if type(p) == tuple:
        operator = p[0]
        left_expr = format_expression(p[1])
        right_expr = format_expression(p[2])
        if operator == 'and':
            return f"({left_expr}.{right_expr})"
        elif operator == 'or':
            return f"({left_expr}+{right_expr})"
        elif operator == 'not':
            return f"~{right_expr}"
    else:
        return p

# Main loop
while True:
    try:
        s = input('>> ')
    except EOFError:
        break
    result = parser.parse(s)
    calculated_result = run(result)
    simplified_expression = format_expression(result)
    print("Result of Boolean Expression:", calculated_result)
    print("Simplified Expression:", simplified_expression)

