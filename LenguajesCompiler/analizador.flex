/*Seccion de codigo de usuario*/
package LeguajesCompiler.Lexico;
import LeguajesCompiler.Lexico.Yytoken;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.Reader;
import java.io.IOException;
import java.util.ArrayList;
import java_cup.runtime.*;



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
	/*  Generamos un java_cup.Symbol para guardar el tipo de token 
        encontrado */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Generamos un Symbol para el tipo de token encontrado 
       junto con su valor */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
//    public AnalizadorLexico() {
//    }	
//    private int contador;
//    private ArrayList<Yytoken> tokens;
//
//	private void writeOutputFile() throws IOException{
//			String filename = "file.out";
//			BufferedWriter out = new BufferedWriter(
//				new FileWriter(filename));
//            System.out.println("\n*** Tokens guardados en archivo ***\n");
//			for(Yytoken t: this.tokens){
//				System.out.println(t);
//				out.write(t + "\n");
//			}
//			out.close();
//	}
//	public ArrayList<Yytoken> getTokens() {
//        return tokens;
//    }
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
//Activar para trabajar con CUP
%cup
//Fin de opciones

//Expresiones regulares
//Declaraciones
LETRA=[A-Za-z]
DIGITO=[0-9]
ALPHANUMERICO={LETRA}|{DIGITO}
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
    //Yytoken t = new Yytoken(contador,yytext(),"comentario",yyline,yycolumn);
    //tokens.add(t);
	return new Symbol(sym.COMENTARIO);
    //return t;
}
{NUMERO}    {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"numero",yyline,yycolumn);
    //tokens.add(t);
	return new Symbol(sym.COMENTARIO , new Integer(yytext()));
    //return t;
}
{ALFANUMERICO}    {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"numero",yyline,yycolumn);
    //tokens.add(t);
	return new Symbol(sym.ALFANUMERICO , new String(yytext()));
    //return t;
}
"WHILE"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"while",yyline,yycolumn);
    //tokens.add(t);
	return new Symbol(sym.WHILE);
    //return t;
}
"FOR"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"for",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.FOR);
	//return t;
}
"TO"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"to",yyline,yycolumn);
    //tokens.add(t);
	return new Symbol(sym.TO);
    //return t;
}
"DO"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"do",yyline,yycolumn);
    //tokens.add(t);
	return new Symbol(sym.DO);
    //return t;
}
"REPEAT"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"repeat",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.REPEAT);
	//return t;
}
"UNTIL"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"until",yyline,yycolumn);
    //tokens.add(t);
	return new Symbol(sym.UNTIL);
    //return t;
}
"IF"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"if",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.IF);
	//return t;
}
"THEN"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"then",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.THEN);
	//return t;
}
"ELSE"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"else",yyline,yycolumn);
    //tokens.add(t);
	return new Symbol(sym.ELSE);
    //return t;
}
"BEGIN"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"begin",yyline,yycolumn);
    //tokens.add(t);
	return new Symbol(sym.BEGIN);
    //return t;
}
"END"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"end",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.END);
	//return t;
}
"LENGTH"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"longitud",yyline,yycolumn);
    //tokens.add(t);
	return new Symbol(sym.LENGTH);
    //return t;
}
"NULL"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"nulo",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.LENGTH);
	//return t;
}
"PROCEDURE"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"procedimiento",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.PROCEDURE);
	//return t;
}
"FUNCTION"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"funcion",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.FUNCTION);
	//return t;
}
"E"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"entrada",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.E);
	//return t;
}
"ES"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"entrad/salida",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.ES);
	//return t;
}
"CALL"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"llamado",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.CALL);
	//return t;
}
"AND"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"op_logico",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.AND);
	//return t;
}
"OR"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"op_logico",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.OR);
	//return t;
}
"NOT"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"op_logico",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.NOT);
	//return t;
}
"MOD"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"modulo",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.MOD);
	//return t;
}
"DIV"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"divicionentera",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.DIVISIONENTERA);
	//return t;
}
"TRUE"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"verdadero",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.TRUE);
	//return t;
}
"FALSE"   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"false",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.FALSE);
	//return t;
}

{IDENTIFICADOR}   {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"id",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.IDENTIFICADOR, yytext());
	//return t;
}
"┌"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"techo_izq",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.PISOALTO1);
	//return t;
}
"┐"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"techo_der",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.PISOALTO2);
	//return t;
}
"└"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"piso_izq",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.PISOBAJO1);
	//return t;
}
"┘"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"piso_der",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.PISOBAJO2);
	//return t;
}
"<"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"op_relacional",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.MENOR);
	//return t;
}
"<-"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"asignacion",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.ASIGNACION);
	//return t;
}
">"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"op_relacional",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.MAYOR);
	//return t;
}
"≤"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"op_relacional",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.MENORIGUAL);
	//return t;
}
"≥"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"op_relacional",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.MAYORIGUAL);
	//return t;
}
"="  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"op_relacional",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.IGUAL);
	//return t;
}
"!="  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"op_relacional",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.DIFERENTE);
	//return t;
}
"+"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"op_matematico",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.SUMA);
	//return t;
}
"*"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"op_matematico",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.MULTIPLICACION);
	return t;
}
"-"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"op_matematico",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.RESTA);
	//return t;
}
"/"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"op_matematico",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.DIVISION);
	//return t;
}
"["  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"[",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.CORCHETEABIERTO);
	//return t;
}
"]"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"]",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.CORCHETECERRADO);
	//return t;
}
"("  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"(",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.PARENTESISABIERTO);
	//return t;
}
")"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),")",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.PARENTESISCERRADO);
	//return t;
}
".."  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"..",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.DOSPUNTOS);
	//return t;
}
"."  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),".",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.UNPUNTO);
	//return t;
}
/*Los metacaracteres es necesario usar la secuencia de escape */
"\^"  {
    contador++;
    //Yytoken t = new Yytoken(contador,yytext(),"potencia",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.POTENCIA);
	//return t;
}
{ESPACIO} {
 	//ignorar
}
{SALTO} {
    contador++;
    //Yytoken t = new Yytoken(contador,"","fin_linea",yyline,yycolumn);
    //tokens.add(t);
    return new Symbol(sym.SALTO);
	//return t;
}
[^]                    { throw new Error("Caracter ilegal <"+yytext()+"> en la linea->"+yyline+"columna->"+yycolumn); }
