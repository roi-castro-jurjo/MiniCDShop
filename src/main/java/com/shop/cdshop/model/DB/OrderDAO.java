package com.shop.cdshop.model.DB;

import com.shop.cdshop.model.JBeans.Cart;
import com.shop.cdshop.model.JBeans.Product;

import java.sql.*;

public class OrderDAO extends DAO {

    public OrderDAO(Connection connection) {
        super(connection);
    }

    public void saveOrder(Cart cart, String username) throws SQLException {
        Connection connection = this.getConexion();

        PreparedStatement preparedStatement = connection.prepareStatement("SELECT id " +
                "FROM \"users\" " +
                "WHERE name = ?");

        preparedStatement.setString(1, username);
        ResultSet result = preparedStatement.executeQuery();

        result.next();

        int userID = result.getInt(1);

        float total = 0;

        for (Product product : cart.getCart().keySet()) {
            total += product.getPrice() * cart.getCart().get(product);
        }

        preparedStatement = connection.prepareStatement("INSERT INTO \"orders\" (user_id, total_price) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS);
        preparedStatement.setInt(1, userID);
        preparedStatement.setFloat(2, total);
        preparedStatement.executeUpdate();

        ResultSet resultSet = preparedStatement.getGeneratedKeys();
        resultSet.next();

        int orderID = resultSet.getInt(1);

        for (Product product: cart.getCart().keySet()) {
            preparedStatement = connection.prepareStatement("INSERT INTO order_items (order_id, product_id, quantity) VALUES (?, ?, ?)");
            preparedStatement.setInt(1, orderID);
            preparedStatement.setInt(2, product.getId());
            preparedStatement.setInt(3, cart.getCart().get(product));
            preparedStatement.executeUpdate();
        }



    }
}