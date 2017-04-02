$(document).ready(function () {
    ('#inputMail').  
});

    function validarEmail(mail) {
        expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (!expr.test(mail))
            alert("Error: La dirección de correo " + mail + " es incorrecta.");
    }

    document.addEventListener('keyup', function (event) {
        if (event.keyCode == 9) {
            whenEmpty();
        }
    });