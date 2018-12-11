/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.fantastica;
import lombok.Data;
import java.util.List;
import java.util.ArrayList;
import org.sql2o.Connection;

/**
 *
 * @author eleicegui-valdez
 */
@Data
public class Producto {
    private int id;
    private int marca_id;
    private int categoria_id;
    private String detalle;


    public String getFullName() {
        List<Marca> marca = new ArrayList<>();
        List<Categoria> categoria = new ArrayList<>();
        String fullName = "";

        String query_marca = "SELECT nombre FROM Marca WHERE id = :id;";
        String query_categoria = "SELECT nombre FROM Categoria WHERE id = :id;";

        try (Connection con = Sql2oDAO.getSql2o().open()) {
            categoria = con
                    .createQuery(query_categoria)
                    .addParameter("id", this.categoria_id)
                    .executeAndFetch(Categoria.class);

            marca = con
                    .createQuery(query_marca)
                    .addParameter("id", this.marca_id)
                    .executeAndFetch(Marca.class);

            fullName = categoria.get(0).getNombre() + " " + marca.get(0).getNombre();
        }
        // catch (Exception e) {
        //     System.out.println(e.getMessage());
        // }

        return fullName;
    }


    public Categoria getCategoria() {
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        Categoria categoria = categoriaDAO.getCategory(this.categoria_id);

        return categoria;
    }

}
