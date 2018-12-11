/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.fantastica;

/**
 *
 * @author eleicegui-valdez
 */

import java.util.List;
import org.sql2o.Sql2o;
import java.util.ArrayList;
import org.sql2o.Connection;


public class DescripcionProductoDAO {

    public DescripcionProducto getDescripcionProducto(int id) {
        DescripcionProducto descripcionProducto = null;

        String query = "SELECT * FROM DescripcionProducto WHERE id = :id;";
        Sql2o sql2o = Sql2oDAO.getSql2o();

        try (Connection con = sql2o.open()) {
            descripcionProducto = con
                .createQuery(query)
                .addParameter("id", id)
                .executeAndFetchFirst(DescripcionProducto.class);
        } catch (Exception e) {
            System.out.println("ERROR getDescripcionProducto: " + e);
        }

        return descripcionProducto;
    }


    public List<DescripcionProducto> getDescriptionsProducts(String category, String type) {
        List<DescripcionProducto> descripciones = new ArrayList();
        List<DescripcionProducto> temporal = new ArrayList();

        List<Producto> productos = new ArrayList();
        if (category.equals("cpu")) {
            ProductoDAO productoDAO = new ProductoDAO();
            productos = productoDAO.getProducts("CPU");
        } else if (category.equals("mother")) {
            ProductoDAO productoDAO = new ProductoDAO();
            productos = productoDAO.getProducts("motherboard");
        } else if (category.equals("ram")) {
            ProductoDAO productoDAO = new ProductoDAO();
            productos = productoDAO.getProducts("Memoria RAM");
        }

        String query = "SELECT * FROM DescripcionProducto WHERE producto_id = :id AND tipo = " + type + ";";

        if (type.equals("all")) {
            query = "SELECT * FROM DescripcionProducto WHERE producto_id = :id";
        }

        Sql2o sql2o = Sql2oDAO.getSql2o();

        try (Connection con = sql2o.open()) {
            for (Producto producto : productos) {
                temporal = con
                    .createQuery(query)
                    .addParameter("id", producto.getId())
                    .executeAndFetch(DescripcionProducto.class);

                for (DescripcionProducto desc : temporal) {
                    descripciones.add(desc);
                }
            }
        } catch (Exception e) {
            System.out.println("ERROR getDescripcionProducto: " + e);
        }

        return descripciones;
    }

}
