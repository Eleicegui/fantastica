package com.mycompany.fantastica;

/**
 *
 * @author eleicegui-valdez
 */

import lombok.Data;
import java.util.Date;


@Data
public class OrdenCompra {
    private int id;
    private int cliente_id;
    private Boolean activa;
    private Date fecha;
    private String estado;


    public Cliente getCliente() {
        ClienteDAO clienteDAO = new ClienteDAO();
        Cliente cliente = clienteDAO.getCliente(this.cliente_id);

        return cliente;
    }
}
