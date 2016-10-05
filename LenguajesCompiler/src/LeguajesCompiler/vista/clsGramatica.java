/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LeguajesCompiler.vista;

import java.io.Serializable;
import java.util.HashMap;
import java.util.LinkedList;

/**
 *
 * @author gian
 */
public class clsGramatica implements Serializable
{

    private LinkedList<String> lstTerminales;
    private LinkedList<String> lstNoTerminales;
    private HashMap<String, LinkedList<String>> gramatica;

    public clsGramatica()
    {
        this.gramatica = new HashMap<>();
        this.lstTerminales = new LinkedList<>();
        this.lstNoTerminales= new LinkedList<>();
    }

    public clsGramatica(LinkedList<String> lstTerminales, LinkedList<String> lstNoTerminales, HashMap<String, LinkedList<String>> gramatica)
    {
        this.lstTerminales = lstTerminales;
        this.lstNoTerminales = lstNoTerminales;
        this.gramatica = gramatica;
    }

    public HashMap<String, LinkedList<String>> getGramatica()
    {
        return gramatica;
    }

    public LinkedList<String> getLstNoTerminales()
    {
        return lstNoTerminales;
    }

    public LinkedList<String> getLstTerminales() {
        return lstTerminales;
    }

    
    
    //hasth<clstabla>

            
  //  tipo, nombre , valor , parametro, subtabla,padre

    public void setLstNoTerminales(LinkedList<String> lstNoTerminales)
    {
        this.lstNoTerminales = lstNoTerminales;
    }

    public void setLstTerminales(LinkedList<String> lstTerminales) {
        this.lstTerminales = lstTerminales;
    }

 

    public void setGramatica(HashMap<String, LinkedList<String>> gramatica)
    {
        this.gramatica = gramatica;
    }

   




}
