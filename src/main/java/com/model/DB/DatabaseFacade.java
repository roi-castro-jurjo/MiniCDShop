package com.model.DB;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseFacade {
    private final Connection connection;

    public DatabaseFacade() throws IOException, SQLException, ClassNotFoundException {
        Class.forName("org.postgresql.Driver");

        Properties configuracion = new Properties();
        FileInputStream configFile;

        configFile = new FileInputStream("/Users/aaronblancolopez/IdeaProjects/CDShop/database.properties");
        configuracion.load(configFile);
        configFile.close();

        Properties usuario = new Properties();

        String gestor = configuracion.getProperty("gestor");

        usuario.setProperty("user", configuracion.getProperty("usuario"));
        usuario.setProperty("password", configuracion.getProperty("clave"));

        this.connection = java.sql.DriverManager.getConnection("jdbc:" + gestor + "://"
                        + configuracion.getProperty("servidor") + ":"
                        + configuracion.getProperty("puerto") + "/"
                        + configuracion.getProperty("baseDatos"),
                usuario);
    }

    public Connection getConnection() {
        return connection;
    }
}
