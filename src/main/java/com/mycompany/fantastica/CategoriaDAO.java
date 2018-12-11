package com.mycompany.fantastica;

/**
 *
 * @author marcos
 */

import java.util.List;
import org.sql2o.Sql2o;
import org.sql2o.Connection;


public class CategoriaDAO {

    public List<Categoria> getAll() {
        List<Categoria> categorias;

        Sql2o sql2o = Sql2oDAO.getSql2o();
        String sql = "SELECT * FROM Categoria ORDER BY nombre";

        try (Connection con = sql2o.open()) {
            categorias = con
                .createQuery(sql)
                .executeAndFetch(Categoria.class);
        }
        return categorias;
    }


    public Categoria getCategory(int id) {
        Categoria categoria;

        Sql2o sql2o = Sql2oDAO.getSql2o();
        String sql = "SELECT * FROM Categoria WHERE id = :id";

        try (Connection con = sql2o.open()) {
            categoria = con
                .createQuery(sql)
                .addParameter("id", id)
                .executeAndFetchFirst(Categoria.class);
        }
        return categoria;
    }


    public Categoria getCategory(String name) {
        Categoria categoria;

        Sql2o sql2o = Sql2oDAO.getSql2o();
        String sql = "SELECT * FROM Categoria WHERE nombre = :name";

        try (Connection con = sql2o.open()) {
            categoria = con
                .createQuery(sql)
                .addParameter("name", name)
                .executeAndFetchFirst(Categoria.class);
        }
        return categoria;
    }

}
