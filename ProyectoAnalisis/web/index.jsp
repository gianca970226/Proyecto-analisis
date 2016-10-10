<%-- 
    Document   : index
    Created on : 9/10/2016, 09:58:57 PM
    Author     : Jorge Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>EditArea Test</title>
        <script language="javascript" type="text/javascript" src="jquery.min.js"></script>
        <script language="javascript" type="text/javascript" src="edit_area/edit_area_loader.js"></script>
        <script language="javascript" type="text/javascript">
            editAreaLoader.init({
                id: "textarea_1"		// textarea id
                , syntax: "css"			// syntax to be uses for highgliting
                , start_highlight: true		// to display with highlight mode on start-up
            });
        </script>
        <script type="text/javascript" src="js1.js"></script>
    </head>
    <body>
        <form method="post">
            <textarea id="textarea_1" name="content" cols="80" rows="1"></textarea>

        </form>

        <button id="enviar">Enviar</button>
        <button id="breakpoint">breakpoint</button>
    </body>
</html>
