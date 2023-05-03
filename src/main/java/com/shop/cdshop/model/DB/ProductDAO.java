package com.shop.cdshop.model.DB;

import com.shop.cdshop.model.JBeans.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class ProductDAO extends DAO{

    public ProductDAO(Connection connection) {
        super(connection);
    }

    public HashMap<Product,Integer> getAllProducts() throws SQLException {
        Connection connection = this.getConexion();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT *" +
                "FROM \"products\" ");
        ResultSet result = preparedStatement.executeQuery();
        HashMap<Product,Integer> products = new HashMap<>();
        while(result.next()){
            Product product = new Product();
            product.setName(result.getString("name"));
            product.setAuthor(result.getString("author"));
            product.setCountry(result.getString("country"));
            product.setPrice(result.getFloat("price"));
            products.put(product, 1);
        }
        return products;
    }

    public Product fetchProduct(String title) throws SQLException {
        Connection connection = this.getConexion();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT *" +
                "FROM \"products\" " +
                "WHERE name = ?");
        preparedStatement.setString(1, title);
        ResultSet result = preparedStatement.executeQuery();
        Product product  = new Product();
        result.next();
        product.setId(result.getInt("id"));
        product.setName(result.getString("name"));
        product.setAuthor(result.getString("author"));
        product.setCountry(result.getString("country"));
        product.setPrice(result.getFloat("price"));
        return product;
    }
}