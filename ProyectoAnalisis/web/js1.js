/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function ()
{

    $("#enviar").on("click", enviar);
    function enviar()
    {
        var texto=editAreaLoader.getValue("textarea_1");
        alert(texto);
    }
    
    $("#breakpoint").on("click", breakpoint);
    function breakpoint()
    {
//        editAreaLoader.insertTags("textarea_1","X","X");
        var campo=document.getElementById("selection_field");
        campo.style.backgroundColor = "red";
    }

});
