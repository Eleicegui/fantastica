package com.mycompany.fantastica;

import org.sql2o.Sql2o;


public class Sql2oDAO {
    protected static Sql2o sql2o;

    public static Sql2o getSql2o() {
        if (sql2o == null) {
            String url = "jdbc:mysql://localhost:3306/fantasticaDB?useSSL=false";
            sql2o = new Sql2o(url, "fantasticaAdmin", "susanita");
        }
        return sql2o;
    }
}
