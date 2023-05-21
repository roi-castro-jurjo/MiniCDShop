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
                    "FROM \"users\" as u " +
                    "WHERE u.email = ? and u.password = ?");
            preparedStatement.setString(1, user.getEmail());
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

    public String fetchUser(String email) {
        Connection connection = this.getConexion();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT name " +
                    "FROM \"users\" as u " +
                    "WHERE u.email = ?");
            preparedStatement.setString(1, email);
            ResultSet result = preparedStatement.executeQuery();
            result.next();
            return result.getString(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void signUp(User user) {
        Connection connection = this.getConexion();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO \"users\" (name,password,email) VALUES(?,?,?)");
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.executeUpdate();
            preparedStatement = connection.prepareStatement("SELECT id " +
                    "FROM \"users\" as u " +
                    "WHERE u.name = ? AND u.password = ?");
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getPassword());
            ResultSet result = preparedStatement.executeQuery();
            result.next();
            preparedStatement = connection.prepareStatement("INSERT INTO \"cards\" (user_id, card_type, number) VALUES (?,?,?)");
            preparedStatement.setInt(1, result.getInt(1));
            preparedStatement.setString(2, user.getCardType());
            preparedStatement.setLong(3, user.getCardNumber());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}