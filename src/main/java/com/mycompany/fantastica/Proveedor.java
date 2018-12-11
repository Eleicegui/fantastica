/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.fantastica;
import lombok.Data;
import java.util.Date;

/**
 *
 * @author marcos
 */
@Data
public class Proveedor {
    private int id;
    private String razon_social;
    private String cuit;
    private String telefono;
    private String direccion;
    private String email;
    private Boolean activo;
    private Date fecha_alta;
    
}
