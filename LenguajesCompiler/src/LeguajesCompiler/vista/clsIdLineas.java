/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LeguajesCompiler.vista;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

/**
 *
 * @author Gianka
 */
public class clsIdLineas {
       public SimpleIntegerProperty id = new SimpleIntegerProperty();
    
    public Integer getNombre(){
        return id.get();
    }
}
