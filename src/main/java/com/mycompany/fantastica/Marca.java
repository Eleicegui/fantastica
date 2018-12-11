/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.fantastica;
import lombok.Data;

/**
 *
 * @author marcos
 */
@Data
public class Marca {
    private int id;
    private int proveedor_id;
    private String nombre;
}
