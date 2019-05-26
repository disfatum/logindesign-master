// грамматика для чтения ini-файлов в варианте 
// формата для клим.справочника

grammar Inifile2;
inifile : iniline * EOF;
iniline :
         key=ANYSYMB '=' val=ANYSYMB NL #keyval
         | '[' headtext=ANYSYMB ']' NL  #header
         | LINE_COMMENT                 #comment
         | NL                           #nl1
         ;
ANYSYMB : (~[\r\n\][=])+ ;
LINE_COMMENT : '//' (~[\r\n])* NL ;
NL : (' ')* '\r'? '\n' ;
fragment SPACE : [ \t] ;



