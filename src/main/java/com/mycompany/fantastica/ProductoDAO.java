package com.mycompany.fantastica;

/**
 *
 * @author eleicegui-valdez
 */

import java.util.List;
import org.sql2o.Sql2o;
import java.util.ArrayList;
import org.sql2o.Connection;


public class ProductoDAO {

    public Producto getProducto(int id) {
        Producto producto = null;

        String query = "SELECT * FROM Producto WHERE id = :id;";
        Sql2o sql2o = Sql2oDAO.getSql2o();

        try (Connection con = sql2o.open()) {
            producto = con
                .createQuery(query)
                .addParameter("id", id)
                .executeAndFetchFirst(Producto.class);
        } catch (Exception e) {
            System.out.println("ERROR getProducto: " + e);
        }

        return producto;
    }


    public List<Producto> getProducts(String category) {
        List<Producto> productos = new ArrayList();
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        Categoria categoria = categoriaDAO.getCategory(category);

        String query = "SELECT * FROM Producto WHERE categoria_id = :category_id";
        Sql2o sql2o = Sql2oDAO.getSql2o();

        try (Connection con = sql2o.open()) {
            productos = con
                .createQuery(query)
                .addParameter("category_id", categoria.getId())
                .executeAndFetch(Producto.class);
        } catch (Exception e) {
            System.out.println("ERROR getProducto by category: " + e);
        }

        return productos;
    }

}
