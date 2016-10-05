/*Seccion de codigo de usuario*/
package LeguajesCompiler.Lexico;
import LeguajesCompiler.Lexico.Yytoken;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;



/* Seccion de opciones y declaraciones de JFlex */
%% //inicio de opciones
//Cambiamos el nombre la funcion para el siguiente token por nextToken
%function nextToken
//Clase publica
%public
//Cambiamos el nombre de la clase del analizador
%class AnalizadorLexico
//Agregamos soporte a unicode
%unicode
//Codigo java
%{
     public AnalizadorLexico() {
    }	
    private int contador;
    private ArrayList<Yytoken> tokens;

	private void writeOutputFile() throws IOException{
			String filename = "file.out";
			BufferedWriter out = new BufferedWriter(
				new FileWriter(filename));
            System.out.println("\n*** Tokens guardados en archivo ***\n");
			for(Yytoken t: this.tokens){
				System.out.println(t);
				out.write(t + "\n");
			}
			out.close();
	}
	public ArrayList<Yytoken> getTokens() {
        return tokens;
    }
%}
//Creamos un contador para los tokens
%init{
    contador = 0;

	tokens = new ArrayList<Yytoken>();
%init}
//Cuando se alcanza el fin del archivo de entrada
%eof{
	try{
		this.writeOutputFile();
        
	}catch(IOException ioe){
		ioe.printStackTrace();
	}
%eof}
//Activar el contador de lineas, variable yyline
%line
//Activar el contador de columna, variable yycolumn
%column
//Fin de opciones

//Expresiones regulares
//Declaraciones
LETRA=[A-Za-z]
DIGITO=[0-9]
ALPHANUMERIC={LETRA}|{DIGITO}
NUMERO=({DIGITO})+
IDENTIFICADOR={LETRA}({ALPHANUMERIC})*
ESPACIO=" "
COMENTARIO="#".({ALPHANUMERIC})*
SALTO=\n|\r|\r\n
//fin declaraciones

/* Seccion de reglas lexicas */
%% 
//Regla     {Acciones}
{COMENTARIO}-\n   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"comentario",yyline,yycolumn);
    tokens.add(t);
    return t;
}
{NUMERO}    {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"numero",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"WHILE"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"while",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"FOR"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"for",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"TO"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"to",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"DO"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"do",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"REPEAT"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"repeat",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"UNTIL"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"until",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"IF"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"if",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"THEN"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"then",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"ELSE"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"else",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"BEGIN"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"begin",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"END"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"end",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"length"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"longitud",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"NULL"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"nulo",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"PROCEDURE"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"procedimiento",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"FUNCTION"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"funcion",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"E"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"entrada",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"ES"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"entrad/salida",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"CALL"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"llamado",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"and"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"op_logico",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"or"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"op_logico",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"not"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"op_logico",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"mod"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"modulo",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"div"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"divicionentera",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"true"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"verdadero",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"false"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"false",yyline,yycolumn);
    tokens.add(t);
    return t;
}

{IDENTIFICADOR}   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"id",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"┌"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"techo_izq",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"┐"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"techo_der",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"└"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"piso_izq",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"┘"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"piso_der",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"<"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"op_relacional",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"<-"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"asignacion",yyline,yycolumn);
    tokens.add(t);
    return t;
}
">"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"op_relacional",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"≤"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"op_relacional",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"≥"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"op_relacional",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"="  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"op_relacional",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"≠"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"op_relacional",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"+"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"op_matematico",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"*"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"op_matematico",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"-"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"op_matematico",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"/"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"op_matematico",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"["  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"[",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"]"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"]",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"("  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"(",yyline,yycolumn);
    tokens.add(t);
    return t;
}
")"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),")",yyline,yycolumn);
    tokens.add(t);
    return t;
}
".."  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"..",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"."  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),".",yyline,yycolumn);
    tokens.add(t);
    return t;
}
/*Los metacaracteres es necesario usar la secuencia de escape */
"\^"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"potencia",yyline,yycolumn);
    tokens.add(t);
    return t;
}
{ESPACIO} {
 	//ignorar
}
{SALTO} {
    contador++;
    Yytoken t = new Yytoken(contador,"","fin_linea",yyline,yycolumn);
    tokens.add(t);
    return t;
}
[^]                    { throw new Error("Caracter ilegal <"+yytext()+"> en la linea->"+yyline+"columna->"+yycolumn); }
