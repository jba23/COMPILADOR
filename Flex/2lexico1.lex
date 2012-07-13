%{  
   #include <stdio.h>

   #include <conio.h>
   #include <string.h>
#include "y.tab.h"


      char fitxizen[80],palabra[30],texto[10000];
      int i,tmp1,tmp2,konta=0;
char *tok="INEXISTENTE";
%}  

%option noyywrap 

%option yylineno  
minus [a-z] 
mayus [A-Z]
ignora \t|\n|" "  
punto "."

%%
{ignora}+               {;}
{punto}			{printf("PUNTO\t"); return PUNTO; }

{minus}*      {
		if ((yyin = fopen("verbos.txt", "rt")) == NULL)
 		{
  		printf("\nNo se puede abrir el archivo: \n");  
 		}
 		else
 		{
			konta=0;
			strcpy(palabra,yytext);
			strcat(palabra,"-");
			while (feof(yyin)==0)
      			{
            			fgets(texto,80,yyin);
            			for(i=0;i<strlen(texto);i++)
            			{
               				if (palabra[0]==texto[i])
               				{
                  				tmp1=0;
                  				tmp2=i;
                  				while ((palabra[tmp1]==texto[tmp2])&&(tmp2<strlen(texto))&&(tmp1!=strlen(palabra)))
                  				{
                        				tmp1++;
                        				tmp2++;
                        				if (tmp1==strlen(palabra))
                           				konta=1;
                  					
						}
               				}
				}
            		}
			if (konta==1)
			{
				tok="VERBO";
				printf("VERBO\t");
				return VERBO;
			}
			else
			{
				if ((yyin = fopen("sustantivos.txt", "rt")) == NULL)
 		{
  		printf("\nNo se puede abrir el archivo: \n");  
 		}
 		else
 		{
			konta=0;
			strcpy(palabra,yytext);
			strcat(palabra,"-");
			while (feof(yyin)==0)
      			{
            			fgets(texto,80,yyin);
            			for(i=0;i<strlen(texto);i++)
            			{
               				if (palabra[0]==texto[i])
               				{
                  				tmp1=0;
                  				tmp2=i;
                  				while ((palabra[tmp1]==texto[tmp2])&&(tmp2<strlen(texto))&&(tmp1!=strlen(palabra)))
                  				{
                        				tmp1++;
                        				tmp2++;
                        				if (tmp1==strlen(palabra))
                           				konta=2;
                  					
						}
               				}
				}
            		}
			if (konta==2)
			{
				tok="SUSTANTIVO"; printf("SUSTANTIVO \t"); return SUSTANTIVO;
			}
			else
			{
				if ((yyin = fopen("complementos.txt", "rt")) == NULL)
 		{
  		printf("\nNo se puede abrir el archivo: \n");  
 		}
 		else
 		{
			konta=0;
			strcpy(palabra,yytext);
			strcat(palabra,"-");
			while (feof(yyin)==0)
      			{
            			fgets(texto,80,yyin);
            			for(i=0;i<strlen(texto);i++)
            			{
               				if (palabra[0]==texto[i])
               				{
                  				tmp1=0;
                  				tmp2=i;
                  				while ((palabra[tmp1]==texto[tmp2])&&(tmp2<strlen(texto))&&(tmp1!=strlen(palabra)))
                  				{
                        				tmp1++;
                        				tmp2++;
                        				if (tmp1==strlen(palabra))
                           				konta=3;
                  					
						}
               				}
				}
            		}
			if (konta==3)
			{
				tok="COMPLEMENTO"; printf("COMPLEMENTO\t"); return COMPLEMENTO;
			}
			else
{
			printf("TEXTO INCOHERENTE\t"); return INEXISTENTE;
}
			
     		}	
			}
     		}
			}
     		}
	if (tok=="INEXISTENTE"){
printf("TEXTO INCOHERENTE\t"); return INEXISTENTE;
}
		tok="INEXISTENTE";
				
 	}
{mayus}{minus}*		{
				if ((yyin = fopen("articulos.txt", "rt")) == NULL)
 				{
  					printf("\nNo se puede abrir el archivo: \n");  
 				}
 				else
 				{
					konta=0;
					strcpy(palabra,yytext);
					strcat(palabra,"-");
					while (feof(yyin)==0)
      					{
            					fgets(texto,80,yyin);
            					for(i=0;i<strlen(texto);i++)
            					{
               						if (palabra[0]==texto[i])
               						{
                  						tmp1=0;
                  						tmp2=i;
                  						while ((palabra[tmp1]==texto[tmp2])&&(tmp2<strlen(texto))&&(tmp1!=strlen(palabra)))
                  						{
                        						tmp1++;
                        						tmp2++;
                        						if (tmp1==strlen(palabra))
                           						konta=8;
                  					
								}
               						}
						}
            				}
					if (konta==8)
					{
						tok="ARTICULO"; printf("ARTICULO\t");return ARTICULO;
					}
else
{
			printf("TEXTO INCOHERENTE\t"); return INEXISTENTE;
}
				}
	
if (tok=="INEXISTENTE"){
printf("TEXTO INCOHERENTE\t"); return INEXISTENTE;
}	
tok="INEXISTENTE";		
	}
.                        {printf("ERROR LEXICO EN LINEA %d \n",yylineno);}


%%

int main(int argc, char *argv[])
{
char NomArch[50];
printf("Ingrese nombre de archivo: ");
gets(NomArch);
 if ((yyin = fopen(NomArch, "rt")) == NULL)
 {
  printf("\nNo se puede abrir el archivo: %s\n", NomArch);  
 }
 else
 {
//yylex();
yyparse();
 }
 fclose(yyin);
 getchar();
 return 0;
}
