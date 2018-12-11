package com.mycompany.fantastica;

import static spark.Spark.*;

/**
 *
 * @author eleicegui-valdez
 */

public class Main {
    public static void main(String[] args) {
        staticFiles.location("/public");

        get("/", IndexController.getIndex);
        get("/admin", IndexController.admin);

        get("/carro", FantasticaControlador.cart);
        get("/api/cart/list", FantasticaControlador.getCartItems);

        post("/api/cart/addItem", FantasticaControlador.addItem);

        get("/historial", FantasticaControlador.history);
        get("/api/client/getHistory", FantasticaControlador.getHistory);

        get("/arma_computadora", FantasticaControlador.buildPC);
        get("/getDescriptionsProducts", FantasticaControlador.getDescriptionsProducts);

        // ADMIN
        get("/admin/historial", FantasticaControlador.adminHistory);
    }
}
