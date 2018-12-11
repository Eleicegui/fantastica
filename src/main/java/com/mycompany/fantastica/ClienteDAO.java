package com.mycompany.fantastica;

/**
 *
 * @author eleicegui-valdez
 */

import org.sql2o.Sql2o;
import org.sql2o.Connection;


public class ClienteDAO {

    public Cliente getCliente(int id) {
        Cliente cliente = null;

        String query = "SELECT * FROM Cliente WHERE id = :id;";
        Sql2o sql2o = Sql2oDAO.getSql2o();

        try (Connection con = sql2o.open()) {
            cliente = con
                .createQuery(query)
                .addParameter("id", id)
                .executeAndFetchFirst(Cliente.class);
        } catch (Exception e) {
            System.out.println("ERROR getCliente: " + e);
        }

        return cliente;
    }

}
