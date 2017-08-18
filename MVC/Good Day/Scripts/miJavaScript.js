

    $(document).ready(function () {
        $('addNota').on('click', function () {

            

            IDtagLink = $(this).attr('id')

            IDtagForm = $(this).attr('id')

            if (IDtagLink == IDtagForm) {

            $(this)('formAddNote').toggle();

            }
            alert($(this).attr('id'));  
        })
    });




