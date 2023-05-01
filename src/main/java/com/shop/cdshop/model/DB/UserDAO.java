package com.shop.cdshop.model.DB;

import com.shop.cdshop.model.JBeans.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO extends DAO {

    public UserDAO(Connection connection) {
        super(connection);
    }

    public boolean login(User user) {
        Connection connection = this.getConexion();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * " +
                    "FROM \"User\" as u " +
                    "WHERE u.name = ? and u.password = ?");
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getPassword());

            ResultSet result = preparedStatement.executeQuery();
            if (!result.next()) {
                System.out.println("El usuario no existe.");
                return false;
            } else {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}