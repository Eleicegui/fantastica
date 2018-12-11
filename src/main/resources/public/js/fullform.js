$(function() {
    $(".total").hide();

    $("#escritorio").on("click", function() {
        let index = 1;

        $.getJSON("/getDescriptionsProducts", {"category": "cpu", "type": "all"}, function(data) {
            for (let item in data) {
                let fullName = data[item]["producto"]["fullName"];
                let description_id = data[item]["id"];
                let type = data[item]["tipo"];

                // $("#cpu-options span").each(function() {
                //     let $span = $(this);
                //     console.log($span.children("label"));
                // });

                let model = "<div style='font-size: 50%; margin-top: 10px;'>" + data[item]["modelo"] + "</div>";
                let price = "<div style='font-size: 50%; margin-top: 10px;'>$" + data[item]["precio"] + "</div>";
                let image = "<img src='../img/" + data[item]["imagen"] + "'>";

                $("#cpu-options span:nth-child(" + index + ")").children("input")[0]["id"] = description_id;  // para guardar el tipo (compatibilidad)
                $("#cpu-options span:nth-child(" + index + ")").children("input")[0]["value"] = description_id;
                $("#cpu-options span:nth-child(" + index + ")").children("input").attr("tipo", type);
                $("#cpu-options span:nth-child(" + index + ")").children("input").attr("precio", data[item]["precio"]);
                $("#cpu-options span:nth-child(" + index + ")").children("label")[0].innerHTML = image + fullName + model + price;
                $("#cpu-options span:nth-child(" + index + ")").children("label")[0].setAttribute("for", description_id);
                index += 1;
            }
            calcularTotal();
        });

    });

    // click en un CPU
    $("[name=cpu]").on("click", function() {
        let index = 1;
        let tipo = $(this).attr("tipo");

        $.getJSON("/getDescriptionsProducts", {"category": "mother", "type": tipo}, function(data) {
            for (let item in data) {
                let fullName = data[item]["producto"]["fullName"];
                let description_id = data[item]["id"];

                let model = "<div style='font-size: 50%; margin-top: 10px;'>" + data[item]["modelo"] + "</div>";
                let price = "<div style='font-size: 50%; margin-top: 10px;'>$" + data[item]["precio"] + "</div>";
                let image = "<img src='../img/" + data[item]["imagen"] + "'>";

                $("#mother-options span:nth-child(" + index + ")").show();
                $("#mother-options span:nth-child(" + index + ")").children("input")[0]["id"] = description_id;
                $("#mother-options span:nth-child(" + index + ")").children("input")[0]["value"] = description_id;
                $("#mother-options span:nth-child(" + index + ")").children("input").attr("precio", data[item]["precio"]);
                $("#mother-options span:nth-child(" + index + ")").children("label")[0].innerHTML = image + fullName + model + price;
                $("#mother-options span:nth-child(" + index + ")").children("label")[0].setAttribute("for", description_id);
                index += 1;
            }

            let resto = 3 - data.length;
            while (resto > 0) {
                $("#mother-options span:nth-child(" + index + ")").hide();
                index += 1;
                resto -= 1;
            }
            calcularTotal();
        });

    });


    // click en un Motherboard
    $("[name=mother]").on("click", function() {
        let index = 1;

        $.getJSON("/getDescriptionsProducts", {"category": "ram", "type": "0"}, function(data) {
            for (let item in data) {
                let fullName = data[item]["producto"]["fullName"];
                let description_id = data[item]["id"];

                let model = "<div style='font-size: 50%; margin-top: 10px;'>" + data[item]["modelo"] + "</div>";
                let price = "<div style='font-size: 50%; margin-top: 10px;'>$" + data[item]["precio"] + "</div>";
                let image = "<img src='../img/" + data[item]["imagen"] + "'>";

                $("#ram-options span:nth-child(" + index + ")").children("input")[0]["id"] = description_id;
                $("#ram-options span:nth-child(" + index + ")").children("input")[0]["value"] = description_id;
                $("#ram-options span:nth-child(" + index + ")").children("input").attr("precio", data[item]["precio"]);
                $("#ram-options span:nth-child(" + index + ")").children("label")[0].innerHTML = image + fullName + model + price;
                $("#ram-options span:nth-child(" + index + ")").children("label")[0].setAttribute("for", description_id);
                index += 1;
            }
            calcularTotal();
        });

    });

    $("[name=ram]").on("click", function() {
        calcularTotal();
        setTimeout(function() {
            $(".total").show();
        }, 1000);
    });


    function calcularTotal() {
        let total = 0;
        $("form").each(function()  {
            let cpu = $(this).find(":input:checked")[1];
            let mother = $(this).find(":input:checked")[2];
            let ram = $(this).find(":input:checked")[3];
            total = parseInt($(cpu).attr("precio")) + parseInt($(mother).attr("precio")) + parseInt($(ram).attr("precio"));
        });
        $(".total").text("$" + total);
    }


    $("form").submit(function(e){
        e.preventDefault();
    });


    $(".fs-submit").on("click", function() {
        $("form").each(function()  {
            let cpu = $(this).find(":input:checked")[1];
            let mother = $(this).find(":input:checked")[2];
            let ram = $(this).find(":input:checked")[3];

            addItem($(cpu).val(), false);
            setTimeout(function() {
                addItem($(mother).val(), false);
            }, 500);
            setTimeout(function() {
                addItem($(ram).val(), true);
            }, 500);
        });
    });


    function addItem(descripcionProducto_id, redirect) {
        $.ajax({
            type: "POST",
            url: "/api/cart/addItem",
            data: {
                "client_id": 3,
                "descripcionProducto_id": descripcionProducto_id,
            },
            success: function (result) {
                if (redirect == true) {
                    window.location.href = "/carro";
                }
            },
            error: function(xhr, textStatus, errorThrown) {
                console(xhr.responseText);
                console(xhr);
            }
        });
    }


});
