/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LeguajesCompiler.vista;

//import LeguajesCompiler.Lexico.clsToken;
//import LeguajesCompiler.Semantico.clsSemantico;
//import LeguajesCompiler.Main;
//import LeguajesCompiler.Sintactico.clsAnalizadorSin;
//import LeguajesCompiler.Sintactico.clsGramatica;
//import LeguajesCompiler.Sintactico.frmArbol;
import LeguajesCompiler.Main;
import LeguajesCompiler.Lexico.AnalizadorLexico;
import LeguajesCompiler.Lexico.Yytoken;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.MenuItem;
import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.KeyCode;
import javafx.scene.layout.AnchorPane;
import javafx.scene.text.TextFlow;
import javafx.scene.web.HTMLEditor;
import javafx.stage.FileChooser;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 * FXML Controller class
 *
 * @author gian
 */
public class VentanaController implements Initializable {

    private String ruta = "";
    private File file;
    Main main;

    @FXML
    private AnchorPane anchorPane;

    @FXML
    private TabPane tabPanebEditor;
    @FXML
    private TabPane tabPaneErrores;
    @FXML
    private TabPane tabPaneNavegador;

    @FXML
    private Tab tabEditor;
    @FXML
    private Tab tabErrores;
    @FXML
    private Tab tabNavegador;
    @FXML
    private TextArea erroresLexicos;
    @FXML
    private TextArea textarea;
    @FXML
    private TextArea textAreaLineas;
    @FXML
    private TextArea textAreaToken;
    @FXML
    private TextArea textAreaGramatica;
    @FXML
    private TextField textfield;
    @FXML
    private TextFlow textflow;
    @FXML
    private TextArea textAreaOtros;
    @FXML
    private MenuItem menuItemAbrir;
    @FXML
    private HTMLEditor htmleditor;
    @FXML
    private TableView<clstableTokens> tablaPersonas;
    @FXML
    private TableColumn nombreCL;
    @FXML
    private TableColumn apellidoCL;
    @FXML
    private TableColumn edadCL;
    @FXML
    private TableColumn telefonoCL;
    ObservableList<clstableTokens> personas;
    AnalizadorLexico analizadorLexico;
//     clsSemantico analizadorSemantico;
//      clsAnalizador analizadorLexico;

    @FXML
    private void Ejecutar() {
        
        generarListaTokens();
        mostrarListaTokens();
        //   analizadorSemantico=new clsSemantico();
        //        analizadorLexico = new clsAnalizador(); 
        //        analizadorlexico();
    }
    public void generarListaTokens() {
        String entrada = textarea.getText();
        InputStream is = new ByteArrayInputStream(entrada.getBytes());
        System.out.println("\n*** Ejecutando ***\n");
        BufferedReader bf = null;
        try {
            bf = new BufferedReader(new InputStreamReader(is));
            analizadorLexico = new AnalizadorLexico(bf);
            Yytoken token = null;
            do {
                try{
                token = analizadorLexico.nextToken();
                }
                catch(Error E)
                {
                    System.out.println(E.getMessage());
                    erroresLexicos.setText(E.getMessage());
                }
                } while (token != null);
        } catch (Exception ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                bf.close();
            } catch (IOException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        System.out.println("\n*** Ejecucion finalizada ***\n");
    }
    public void mostrarListaTokens() {
         inicializarTablaToken();
        for (int i = 0; i < analizadorLexico.getTokens().size(); i++) {
           añadirToken(analizadorLexico.getTokens().get(i).tipo, analizadorLexico.getTokens().get(i).token,analizadorLexico.getTokens().get(i).linea,analizadorLexico.getTokens().get(i).columna);
//          
        }
    }

//       public void analizadorlexico(){
//           
//        String [] linea=textarea.getText().split("\n"); 
//        System.out.println("cantidad de split  "+linea.length);
//                      
//        for (int i = 0; i < linea.length; i++) {
//
//            analizadorLexico.recorrerAutomata(linea[i],i+1);
//
//        }
//
//        textAreaToken.setText("Token        Valor       Linea\n");
//        
//       
//        
//        for (int i = 0; i < analizadorLexico.getLstTokens().size(); i++)
//        {
//            añadirToken(analizadorLexico.getLstTokens().get(i).getNombre(), analizadorLexico.getLstTokens().get(i).getValor(),analizadorLexico.getLstTokens().get(i).getLinea(), analizadorLexico.getLstTokens().get(i).getColumna());
//          
//            
//            /*textAreaToken.setText(textAreaToken.getText()+analizador.getLstTokens().get(i).getNombre()
//                   +"       "+analizador.getLstTokens().get(i).getValor()
//                   +"       ("+analizador.getLstTokens().get(i).getLinea()
//                   +" , " +analizador.getLstTokens().get(i).getColumna()+")\n");*/
//        }
//        
//        //LISTATOKEN
//        
//        String h="";
//        boolean ban=true;
//        String aux="";
//        
//        
//        for (int i = 0; i < analizadorLexico.getLstTokens().size(); i++) {
//            
//            h=h+analizadorLexico.getLstTokens().get(i).getNombre()+",";
//            
//            if (analizadorLexico.getLstTokens().get(i).getNombre().equals("err")) {
//                
//                aux=aux+"\n"+analizadorLexico.getLstTokens().get(i).getLinea()+" , "+analizadorLexico.getLstTokens().get(i).getColumna()+" -> "+analizadorLexico.getLstTokens().get(i).getNombre()+" : "+analizadorLexico.getLstTokens().get(i).getValor();
//                
//                ban=false;
//                
//            }
//            
//        }
//        
//        h=h.substring(0, h.length()-1);
//        
//        
//        
//           if (ban) {
//               
//               analizadorsinstactico(h,analizadorLexico.getLstTokens());
//           }
//           else{
//           
//               textAreaOtros.setText("Errores Lexicos\n\n"+aux);
//               
//           }
//        
//        
//         
//        
//        
//    }
    @FXML
    private String Cargartxt() throws FileNotFoundException, IOException {

        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Elige Tu Archivo");
        //this.file=fileChooser.showOpenDialog(LeguajesCompiler.Main.primaryStage); //
        this.file = new File("D:/Semestre VII/Analisis y Diseño de Algoritmos/ProyectoAnalisis/Proyecto-analisis/LenguajesCompiler/src/LeguajesCompiler/vista/programa.txt");
        this.ruta = file.getAbsolutePath();//"/home/sebastian/NetBeansProjects/LenguajesCompiler/src/LeguajesCompiler/vista/textoprueba.txt";

        String cadena;
        String texto = "";
        String texto1 = "";
        FileReader f;

        f = new FileReader(ruta);
        BufferedReader b = new BufferedReader(f);

        while ((cadena = b.readLine()) != null) {

            texto1 = texto1 + "\n" + cadena;

        }
        b.close();

        textarea.setText(texto1);

        inicializarLineas();
        return texto;
    }

//    @FXML
//    private void CargarGramatica() throws FileNotFoundException, IOException {
//
//        FileChooser fileChooser = new FileChooser();
//        fileChooser.setTitle("Elige Tu Archivo");
//        // this.file=fileChooser.showOpenDialog(LeguajesCompiler.Main.primaryStage); //
//
//        String ruta = "/media/gian/Datos D/Semestre VII/Analisis y Diseño de Algoritmos/ProyectoAnalisis/LenguajesCompiler/src/LeguajesCompiler/vista/analizador.flex";//file.getAbsolutePath();//"/home/sebastian/NetBeansProjects/LenguajesCompiler/src/LeguajesCompiler/vista/textoprueba.txt";
//
//        String cadena;
//
//        String texto1 = "";
//        FileReader f;
//
//        f = new FileReader(ruta);
//        BufferedReader b = new BufferedReader(f);
//
//        while ((cadena = b.readLine()) != null) {
//
//            texto1 = texto1 + cadena + "\n";
//
//        }
//        b.close();
//
//        textAreaGramatica.setText(texto1);
//
//    }
    public void Guardartxt() throws IOException {

        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Guardar Archivo");
        //this.file=fileChooser.showSaveDialog(LeguajesCompiler.Main.primaryStage); //
        this.file = new File("D:/Semestre VII/Analisis y Diseño de Algoritmos/ProyectoAnalisis/Proyecto-analisis/LenguajesCompiler/src/LeguajesCompiler/vista/programa.txt");
        //D:/Semestre VII/Analisis y Diseño de Algoritmos/ProyectoAnalisis/Proyecto-analisis/LenguajesCompiler/src/LeguajesCompiler/vista/programa.txt
        System.out.println("-------------> Se guardo");

        String f = "";

        FileWriter fw = null;
        BufferedWriter bw = null;

        // EL segundo parametro es un boolean
        // En true escribe al final
        // En false escribe al inicio
        fw = new FileWriter(file, false);
        bw = new BufferedWriter(fw);

        String texto = this.textarea.getText();

        System.out.println(texto);

        bw.write(texto, 0, texto.length());
        //FileDialog dialogoArchivo; 
        //dialogoArchivo = new FileDialog(f,"Lista de Archivos desde Frame", FileDialog.SAVE); 
        // dialogoArchivo.show();
        bw.close();

        System.out.println("termino guardas");

    }

//    public void GuardarGramatica() throws IOException {
//
//        FileChooser fileChooser = new FileChooser();
//        fileChooser.setTitle("Guardar Archivo");
//        // this.file=fileChooser.showSaveDialog(LeguajesCompiler.Main.primaryStage); //
//
//        this.file = new File("/media/gian/Datos D/Semestre VII/Analisis y Diseño de Algoritmos/ProyectoAnalisis/LenguajesCompiler/src/LeguajesCompiler/vista/analizador.flex");
//
//        System.out.println("" + LeguajesCompiler.Main.primaryStage);
//
//        String f = "";
//
//        FileWriter fw = null;
//        BufferedWriter bw = null;
//
//        // EL segundo parametro es un boolean
//        // En true escribe al final
//        // En false escribe al inicio
//        fw = new FileWriter(file, false);
//        bw = new BufferedWriter(fw);
//
//        String texto = this.textAreaGramatica.getText();
//
//        bw.write(texto, 0, texto.length());
//        //FileDialog dialogoArchivo; 
//        //dialogoArchivo = new FileDialog(f,"Lista de Archivos desde Frame", FileDialog.SAVE); 
//        // dialogoArchivo.show();
//        bw.close();
//
//        System.out.println("se guardo la gramatica");
//
//    }
    private void inicializarLineas() {

        int numfilas = (textarea.getText()).split("\n").length;

        textAreaLineas.setText("");

        for (int i = 1; i <= numfilas; i++) {

            textAreaLineas.setText(textAreaLineas.getText() + i + "\n");
            textAreaLineas.appendText("");
        }

        //textAreaLineas.scrollTopProperty().bindBidirectional(textarea.scrollTopProperty());
        textAreaLineas.scrollTopProperty().set(textarea.scrollTopProperty().get());

    }

    @FXML
    private void lineasEnter() {

        String[] vcodigo = (textarea.getText() + " ").split("\n");

        int nlines = vcodigo.length + 1;
        // System.out.println("texto lineas totales : "+nlines);

        String aux = textAreaLineas.getText() + nlines + "\n";

        textAreaLineas.setText("" + aux);
        textAreaLineas.appendText("");

    }

    @FXML
    private void lineasAtras() {

        String[] vcodigo = (textarea.getText() + " ").split("\n");
        int nlines = vcodigo.length;

        System.out.println("linea actual: " + nlines);

        String lineas = textAreaLineas.getText();

        int ind = lineas.indexOf("" + nlines);

        String aux = lineas.substring(ind, lineas.length());

        String aux1 = lineas.replace(aux + "", "");

        System.out.println("quedo:\n" + aux1);

        textAreaLineas.setText(aux1 + nlines + "\n");
        textAreaLineas.appendText("");

    }

    @FXML
    private void añadirToken(String token, String lexema, int fila, int columna) {

        clstableTokens p1 = new clstableTokens();
        p1.nombre.set(token);
        p1.apellido.set(lexema);
        p1.edad.set(fila);
        p1.telefono.set("" + columna);
        personas.add(p1);

    }

    private void inicializarTablaToken() {

        nombreCL.setCellValueFactory(new PropertyValueFactory<clstableTokens, String>("nombre"));
        apellidoCL.setCellValueFactory(new PropertyValueFactory<clstableTokens, String>("apellido"));
        edadCL.setCellValueFactory(new PropertyValueFactory<clstableTokens, Integer>("edad"));
        telefonoCL.setCellValueFactory(new PropertyValueFactory<clstableTokens, String>("telefono"));

        personas = FXCollections.observableArrayList();
        tablaPersonas.setItems(personas);

    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        inicializarLineas();

        inicializarTablaToken();

        try {

            Cargartxt();
        } catch (IOException ex) {
            Logger.getLogger(VentanaController.class.getName()).log(Level.SEVERE, null, ex);
        }

        textarea.setOnKeyPressed(event -> {

            if (event.getCode() == KeyCode.ENTER) {

                lineasEnter();

            }

        });

        textarea.setOnKeyReleased(event -> {

            if (event.getCode() == KeyCode.BACK_SPACE) {

                lineasAtras();
            } else if (event.getCode() == KeyCode.DELETE) {

                lineasAtras();
            }

        });

    }

    public TextArea getTextAreaOtros() {
        return textAreaOtros;
    }

    public void setTextAreaOtros(TextArea textAreaOtros) {
        this.textAreaOtros = textAreaOtros;
    }

}
