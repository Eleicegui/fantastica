package com.mycompany.fantastica;

/**
 *
 * @author eleicegui-valdez
 */


import spark.Request;
import spark.Response;
import spark.Route;
import java.util.List;
import java.util.HashMap;
import spark.ModelAndView;
import com.fasterxml.jackson.databind.ObjectMapper;
import spark.template.velocity.VelocityTemplateEngine;


public class FantasticaControlador {

    public static Route cart = (Request req, Response res) -> {
        HashMap model = new HashMap();
        model.put("title", "Carro de compras");
        model.put("template", "templates/main.vsl");

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/fantastica.vsl"));
    };


    public static Route getCartItems = (Request req, Response res) -> {
        String client_id = req.queryParams("client_id");

        DescripcionOrdenDAO descripcionOrdenDAO = new DescripcionOrdenDAO();
        List<DescripcionOrden> descripciones = descripcionOrdenDAO.getCartItems(client_id);

        HashMap model = new HashMap();
        model.put("descripciones", descripciones);

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/carro.vsl"));
    };


    public static Route addItem = (Request req, Response res) -> {
        String client_id = req.queryParams("client_id");
        String descripcionProducto_id = req.queryParams("descripcionProducto_id");

        DescripcionOrdenDAO descripcionOrdenDAO = new DescripcionOrdenDAO();
        String mensaje = descripcionOrdenDAO.addItem2Cart(client_id, descripcionProducto_id);

        return mensaje;
    };


    public static Route history = (Request req, Response res) -> {
        HashMap model = new HashMap();
        model.put("title", "Historial de compras");
        model.put("template", "templates/main_history.vsl");

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/fantastica.vsl"));
    };


    public static Route getHistory = (Request req, Response res) -> {
        String client_id = req.queryParams("client_id");

        OrdenCompraDAO ordenDAO = new OrdenCompraDAO();
        List<OrdenCompra> ordenesCompra = ordenDAO.getHistory(client_id);
        Boolean admin = false;
        HashMap model = new HashMap();
        model.put("ordenesCompra", ordenesCompra);

        if (client_id.equals("all")) {
            admin = true;
        }
        model.put("admin", admin);

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/historial.vsl"));
    };


    public static Route buildPC = (Request req, Response res) -> {
        HashMap model = new HashMap();
        model.put("title", "Armá tu computadora");

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/fullform.vsl"));
    };


    public static Route getDescriptionsProducts = (Request req, Response res) -> {
        String category = req.queryParams("category");
        String type = req.queryParams("type");

        DescripcionProductoDAO descripcionProductoDAO = new DescripcionProductoDAO();
        List<DescripcionProducto> descripciones = descripcionProductoDAO.getDescriptionsProducts(category, type);

        ObjectMapper mapperObj = new ObjectMapper();
        String jsonStr = mapperObj.writeValueAsString(descripciones);
        return jsonStr;
    };


    // ADMIN

    public static Route adminHistory = (Request req, Response res) -> {
        HashMap model = new HashMap();
        model.put("title", "Órdenes de compras");
        model.put("template", "templates/main_admin_history.vsl");

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/admin.vsl"));
    };
}
