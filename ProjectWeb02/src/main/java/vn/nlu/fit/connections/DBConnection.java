package vn.nlu.fit.connections;

import java.sql.*;

public class DBConnection {

    private static String USER = "root";
    private static String PASS = "";

    private static String hostName = "localhost";
    private static String dbName = "webproject";
    private static String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;

    public static Connection getMySQLConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                conn = DriverManager.getConnection(connectionURL, USER, PASS);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return conn;
    }
}
