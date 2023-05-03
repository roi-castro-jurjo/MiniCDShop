package com.shop.cdshop.model.DB;

import com.shop.cdshop.model.JBeans.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO extends DAO{

    public ProductDAO(Connection connection) {
        super(connection);
    }

    public ArrayList<Product> getAllProducts() throws SQLException {
        Connection connection = this.getConexion();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT *" +
                "FROM \"products\" ");

        ResultSet result = preparedStatement.executeQuery();

        ArrayList<Product> products = new ArrayList<>();

        while(result.next()){
            Product product = new Product();
            product.setName(result.getString("name"));
            product.setAuthor(result.getString("author"));
            product.setCountry(result.getString("country"));
            product.setPrice(result.getFloat("price"));

            products.add(product);
        }

        return products;

    }
}