

    //$(document).ready(function () {
    //    $('addNota').on('click', function () {

            

    //        IDtagLink = $(this).attr('id')

    //        IDtagForm = $(this).attr('id')

    //        if (IDtagLink == IDtagForm) {

    //        $(this)('formAddNote').toggle();

    //        }
    //        alert($(this).attr('id'));  
    //    })
    //});




    $(document).ready(function () {

        $(document).on('click', '.addNotaa', function () {

            var id = $(this).prop('id');
            var idForm = id.substring(id.indexOf('-') + 1, id.length);

            $('#divForm-' + idForm).toggle();
        })
    });







