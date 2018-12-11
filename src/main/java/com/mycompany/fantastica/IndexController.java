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
import spark.template.velocity.VelocityTemplateEngine;


public class IndexController {

    public static Route getIndex = (Request req, Response res) -> {
        CategoriaDAO cDAO = new CategoriaDAO();
        List<Categoria> categorias = cDAO.getAll();

        HashMap model = new HashMap();
        model.put("categorias", categorias);
        model.put("title", "Fantástica");
        model.put("template", "templates/index.vsl");

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/fantastica.vsl"));
    };


    public static Route admin = (Request req, Response res) -> {
        HashMap model = new HashMap();
        model.put("title", "Fantástica - Admin");
        model.put("template", "templates/main_admin.vsl");

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/admin.vsl"));
    };

}

