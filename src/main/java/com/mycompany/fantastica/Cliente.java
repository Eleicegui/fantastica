package com.mycompany.fantastica;

/**
 *
 * @author eleicegui-valdez
 */

import lombok.Data;
import java.util.Date;


@Data
public class Cliente {
    private int id;
    private String nombre;
    private String direccion;
    private String cuil;
    private Date fecha_alta;
}
