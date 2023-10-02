%{
   
  int cnt_identifier=0;
  int cnt_statement=0;
  int cnt_keyword=0;
%} 

variable   		    [a-zA-Z_][a-zA-Z_0-9]{0,31}
datatype   			("intt"|"floatt"|"charr"|"stringg"|"booleang")
intt   			    [\+\-]?[0-9]+
floatt    			({intt}([\.]{intt})?(e[\+\-]?{intt})|{intt}([\.]{intt}))
booleann     		("sotto"|"mittha")
charr  			    ("'\\n'"|[\'][^\n][\'])
stringg     	    [\"].*[\"]
stmn        		(";")
assignmentOp 			=
logicalOp			("or"|"and"|"xor")
bitwiseOp 			(&|\|\^|>>|<<)
indecOp			    ("++"|"--")
arithmeticOp    	(\+|\-|\*|\/|%)
ass_init            (\+=|\-=|\*=|\/=|%=|&=|\|=|\^=|<<=|>>=)
compareOp           (<|>|<=|>=|==)
continue	        ("cholVai")
break				("thamVai")
return             	("seshkorVai")
comma				,
singleline			("//")[^\n]*
multiline			("/\*").*?("\*/")
if           		("jodi")[ ]*[\(].*[\)][ ]*[\{].*[\}]
elseif            	("nahole")[ ]*[\(].*[\)][ ]*[\{].*[\}]
else            	("ontoto")[ ]*[\{].*[\}]
if_condition		{if}[ ]*{elseif}*?{else}?
forloop   			("for")[ ]{variable}[ ]("in")[ ]{variable}[ ]*[\{].*[\}]
whileloop			("while")[ ]*[\(].*[\)][ ]*[\{].*[\}]
			

%%
{booleann}                     {}
{break}                         {cnt_keyword++;}
{return}                        {cnt_keyword++;}
{continue}                      {cnt_keyword++;}
{stmn}                          {cnt_statement++;}
{logicalOp}			            {}
{compareOp}                     {}   
{datatype}                      {cnt_keyword++;}
{variable}                      {cnt_identifier++;}
{intt}                          {}
{floatt}                        {}
{stringg}                       {}
{charr}                         {}     		            
{assignmentOp}			        {}
{arithmeticOp}    	            {}
{ass_init}                      {}   
{bitwiseOp}			            {}
{indecOp}			            {}    	
{comma}				            {}
{singleline}			        {}
{multiline}			            {}
{if}           		            {}
{elseif}            	        {}
{else}            	            {}
{if_condition}		            {}
{forloop}   			        {}
{whileloop}                     {}
.                               {}
%%

int yywrap()
{
}

int main()
{
    yylex();
    printf("Total Identifier  %d\n",cnt_identifier);
    printf("Total keyword  %d\n",cnt_keyword);
    printf("Total statement  %d\n",cnt_statement);
    return 0;
}