package com.model.DB;

import java.sql.Connection;

public class ProductDAO extends DAO{

    public ProductDAO(Connection connection) {
        super(connection);
    }
}