$(function() {
    $(".addItem").on("click", function() {
        let descripcionProducto_id = $(this).attr('id');

        $.ajax({
          type: 'POST',
          url: "/api/cart/addItem",
          data: {
            'client_id': 3,
            'descripcionProducto_id': descripcionProducto_id,
          },
          success: function (result) {
            $(".alert").fadeIn().delay(2000).fadeOut(1000);
          },
          error: function(xhr, textStatus, errorThrown) {
            alert(xhr.responseText);
          }
        });

    });
});
