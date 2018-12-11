package com.mycompany.fantastica;

/**
 *
 * @author eleicegui-valdez
 */

import lombok.Data;
import java.math.BigDecimal;
import java.util.Date;


@Data
public class DescripcionProducto {
    private int id;
    private int producto_id;
    private String modelo;
    private String descripcion;
    private BigDecimal costo;
    private BigDecimal precio;
    private int stock;
    private Date fecha_alta;
    private String imagen;
    private String tipo;


    public Producto getProducto() {
        ProductoDAO productoDAO = new ProductoDAO();
        Producto producto = productoDAO.getProducto(this.producto_id);

        return producto;
    }
}
