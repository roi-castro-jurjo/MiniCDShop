package com.shop.cdshop.DB;

import java.sql.Connection;

public abstract class DAO {
    private Connection conexion;

    public DAO(Connection conexion) {
        this.conexion = conexion;
    }

    protected Connection getConexion(){
        return this.conexion;
    }

    protected void setConexion(Connection conexion){
        this.conexion=conexion;
    }
}