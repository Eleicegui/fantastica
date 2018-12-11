package com.mycompany.fantastica;

/**
 *
 * @author eleicegui-valdez
 */

import java.util.Date;
import java.util.List;
import java.sql.Timestamp;
import org.sql2o.Connection;
import org.sql2o.Sql2o;


public class OrdenCompraDAO {

    public int insert(String client_id) {
        String insertQuery = "INSERT INTO OrdenCompra (cliente_id, fecha, activa, estado) VALUES " +
                "(:cliente_id, :fecha, true, 'Pendiente');";

        Date date = new Date();
        Timestamp dateSQL = new Timestamp(date.getTime());

        Sql2o sql2o = Sql2oDAO.getSql2o();
        Object ordenCompra_id;

        try (Connection con = sql2o.beginTransaction()) {
            ordenCompra_id = con.createQuery(insertQuery, true)
                .addParameter("cliente_id", Integer.parseInt(client_id))
                .addParameter("fecha", dateSQL)
                .executeUpdate()
                .getKey();
            con.commit();
        }

        return (int) (long) ordenCompra_id;
    }


    public OrdenCompra getOrdenActiva(String client_id) {
        OrdenCompra ordenCompra = null;
        String query = "SELECT * FROM OrdenCompra WHERE cliente_id = :client_id AND activa = true";
        Sql2o sql2o = Sql2oDAO.getSql2o();

        try (Connection con = sql2o.open()) {
            ordenCompra = con
                .createQuery(query)
                .addParameter("client_id", Integer.parseInt(client_id))
                .executeAndFetchFirst(OrdenCompra.class);
        } catch (Exception e) {
            System.out.println("ERROR getOrden: " + e);
        }
        return ordenCompra;
    }


    public List<OrdenCompra> getHistory(String client_id) {
        String query = "SELECT * FROM OrdenCompra WHERE cliente_id = :client_id ORDER BY fecha";
        if (client_id.equals("all")) {
            query = "SELECT * FROM OrdenCompra ORDER BY fecha";
        }
        Sql2o sql2o = Sql2oDAO.getSql2o();
        List<OrdenCompra> ordenesCompra = null;

        try (Connection con = sql2o.open()) {
            if (client_id.equals("all")) {
                ordenesCompra = con
                    .createQuery(query)
                    .executeAndFetch(OrdenCompra.class);
            } else {
                ordenesCompra = con
                    .createQuery(query)
                    .addParameter("client_id", Integer.parseInt(client_id))
                    .executeAndFetch(OrdenCompra.class);
            }
        } catch (Exception e) {
            System.out.println("ERROR history: " + e);
        }
        return ordenesCompra;
    }

}
