%{
int yystopparser=0;  
%}  
 
%token PUNTO VERBO SUSTANTIVO ARTICULO COMPLEMENTO INEXISTENTE
%start inicio  
  
%%  
inicio  :  oracion PUNTO {printf("\n ORACION CORRECTA.");};
oracion : sujeto predicado;

sujeto  : ARTICULO SUSTANTIVO
| SUSTANTIVO;

predicado : VERBO COMPLEMENTO
|VERBO;
