package com.mycompany.fantastica;

/**
 *
 * @author eleicegui-valdez
 */

import lombok.Data;
import java.math.BigDecimal;


@Data
public class DescripcionOrden {
    private int id;
    private int descripcionProducto_id;
    private int ordenCompra_id;
    private BigDecimal costo;
    private BigDecimal precio;
    private Integer cantidad;


    public DescripcionProducto getDescripcionProducto() {
        DescripcionProductoDAO descripcionProductoDAO = new DescripcionProductoDAO();
        DescripcionProducto descripcionProducto = descripcionProductoDAO.getDescripcionProducto(this.descripcionProducto_id);

        return descripcionProducto;
    }
}
