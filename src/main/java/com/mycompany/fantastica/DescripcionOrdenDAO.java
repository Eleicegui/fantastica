package com.mycompany.fantastica;

/**
 *
 * @author eleicegui-valdez
 */

import java.util.List;
import java.util.ArrayList;
import org.sql2o.Sql2o;
import org.sql2o.Connection;


public class DescripcionOrdenDAO {

    public List<DescripcionOrden> getCartItems(String client_id) {
        OrdenCompraDAO ordenDAO = new OrdenCompraDAO();
        OrdenCompra ordenCompra = ordenDAO.getOrdenActiva(client_id);
        List<DescripcionOrden> descripcionesOrden = new ArrayList<>();

        if (ordenCompra != null) {
            String query = "SELECT * FROM DescripcionOrden WHERE ordenCompra_id = :orden_id;";
            Sql2o sql2o = Sql2oDAO.getSql2o();

            try (Connection con = sql2o.open()) {
                descripcionesOrden = con
                    .createQuery(query)
                    .addParameter("orden_id", ordenCompra.getId())
                    .executeAndFetch(DescripcionOrden.class);
            } catch (Exception e) {
                System.out.println("ERROR getCartItems: " + e);
            }
        }

        return descripcionesOrden;
    }


    public int insert(int ordenCompra_id, String descripcionProducto_id) {
        String insertQuery = "INSERT INTO DescripcionOrden " +
            "(descripcionProducto_id, ordenCompra_id, costo, precio, cantidad) " +
            "VALUES (:descripcionProducto_id, :ordenCompra_id, :costo, :precio, :cantidad)";

        Object descripcionOrden_id;
        DescripcionProducto descripcionProducto;
        DescripcionProductoDAO descripcionProductoDAO = new DescripcionProductoDAO();
        descripcionProducto = descripcionProductoDAO.getDescripcionProducto(Integer.parseInt(descripcionProducto_id));

        Sql2o sql2o = Sql2oDAO.getSql2o();

        try (Connection con = sql2o.beginTransaction()) {
            descripcionOrden_id = con.createQuery(insertQuery, true)
                .addParameter("descripcionProducto_id", Integer.parseInt(descripcionProducto_id))
                .addParameter("ordenCompra_id", ordenCompra_id)
                .addParameter("costo", descripcionProducto.getCosto())
                .addParameter("precio", descripcionProducto.getPrecio())
                .addParameter("cantidad", 1)
                .executeUpdate()
                .getKey();
            con.commit();
        }

        return (int) (long) descripcionOrden_id;
    }


    public void updateCantidad(int cantidad, int descripcionOrden_id, String descripcionProducto_id) {
        String updateQuery = "UPDATE DescripcionOrden SET " +
            "cantidad = :cantidad WHERE descripcionProducto_id = :descripcionProducto_id AND " +
            "id = :descripcionOrden_id;";

        Sql2o sql2o = Sql2oDAO.getSql2o();

        try (Connection con = sql2o.beginTransaction()) {
            con.createQuery(updateQuery)
                .addParameter("cantidad", cantidad)
                .addParameter("descripcionProducto_id", Integer.parseInt(descripcionProducto_id))
                .addParameter("descripcionOrden_id", descripcionOrden_id)
                .executeUpdate();
            con.commit();
        }
    }


    public String addItem2Cart(String client_id, String descripcionProducto_id) {
        int cantidad = 1;
        OrdenCompraDAO ordenDAO = new OrdenCompraDAO();
        OrdenCompra ordenCompra = ordenDAO.getOrdenActiva(client_id);
        String mensaje = "Ha ocurrido un error al agregar el producto.";

        if (ordenCompra == null) {
            int ordenCompra_id = ordenDAO.insert(client_id);
            insert(ordenCompra_id, descripcionProducto_id);
            mensaje = "El producto ha sido agregado al carro.";
        } else {
            Boolean isUpdate = false;
            int descripcionOrden_id = 0;
            List<DescripcionOrden> descripcionesOrden = getCartItems(client_id);
            for (DescripcionOrden descripcion : descripcionesOrden) {
                if (descripcion.getDescripcionProducto_id() == Integer.parseInt(descripcionProducto_id)) {
                    cantidad = descripcion.getCantidad() + 1;
                    descripcionOrden_id = descripcion.getId();
                    isUpdate = true;
                    break;
                }
            }

            if (isUpdate) {
                updateCantidad(cantidad, descripcionOrden_id, descripcionProducto_id);
            } else {
                insert(ordenCompra.getId(), descripcionProducto_id);
            }
            mensaje = "El producto ha sido agregado al carro.";
        }

        return mensaje;
    }
}
