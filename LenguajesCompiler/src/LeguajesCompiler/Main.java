/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LeguajesCompiler;

import LeguajesCompiler.vista.VentanaController;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import javax.swing.JOptionPane;

/**
 *
 * @author sebastian
 */
public class Main extends Application {

    public static Stage primaryStage;
    public static VentanaController ventana;

    @Override

    public void start(Stage primaryStage) throws IOException {

        this.primaryStage = primaryStage;

        Parent root = FXMLLoader.load(getClass().getResource("vista/ventana.fxml"));

        Scene scene = new Scene(root);
        this.primaryStage.setTitle("JampX Compiler");
        this.primaryStage.setScene(scene);
        this.primaryStage.show();
        ventana = new VentanaController();

    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
//        generalLexico(args);
        launch(args);
        
    }

    public static void generalLexico(String[] args) {
        System.out.println("\n*** Generando ***\n");
        String archLex = "";
        if (args.length > 0) {
            System.out.println("\n*** Procesando archivo custom ***\n");
            archLex = args[0];
        } else {
            System.out.println("\n*** Procesando archivo default ***\n");
            archLex = "analizador.flex";
        }
        String[] entrada = {archLex};
        jflex.Main.main(entrada);
        //Movemos el archivo generado al directorio src
        File arch = new File("AnalizadorLexico.java");
        if (arch.exists()) {
            System.out.println("" + arch);
            Path currentRelativePath = Paths.get("");
            String nuevoDir = currentRelativePath.toAbsolutePath().toString()
                    + File.separator + "src" + File.separator
                    + "LeguajesCompiler/Lexico" + File.separator + arch.getName();
            System.out.println(nuevoDir);
            File archViejo = new File(nuevoDir);
            archViejo.delete();
            if (arch.renameTo(new File(nuevoDir))) {
                System.out.println("\n*** Generado ***\n");
                System.out.println("\n*** Saliendo automaticamente ***\n");
                System.exit(0);
            } else {
                System.out.println("\n*** No generado ***\n");
            }
        } else {
            System.out.println("\n*** Codigo no existente ***\n");
        }
    }
}
