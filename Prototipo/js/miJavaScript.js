$('#agregarLibreta').on('click', function(){
    //agarramos lo que ingresa el usuario en los inputs
    var titulo = $('#nombreLibreta').val();

var $nuevaLibreta = $('<h2>'+titulo+'</h2>'); 

    //agregamos este nuevo elemento al final del div de artículos
    $('#cajaLibreta').append($nuevaLibreta);
});

/*
Abrir las herramientas

Intento de Hover

$('#libreta').hover(function(){
    $('#barTool').css('display', 'block');
    }, function(){
    $('barTool').css('display', 'none');
});
*/

//Mostrar form registro

$(document).ready(function(){
    $('#btnRegistrar').click(function(){
        $('#formRegistro').show();
        $('#formRegistro').css ('background','#026AA7');
    });
});

/*mostrar barra con funcion toogle

$(document).ready(function(){
    $('#libreta').click(function(){
        $('#barTool').toggle();
        $('#toolLibreta').toggle();
        $('#toolBuscar').hide();
        $('#toolPapelera').hide();
        
    });
});

*/


