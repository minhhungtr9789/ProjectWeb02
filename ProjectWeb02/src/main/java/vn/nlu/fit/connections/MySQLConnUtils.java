package vn.nlu.fit.connections;

import java.sql.*;

public class MySQLConnUtils {

    private static String USER = "root";
    private static String PASS = "";

    private static String hostName = "localhost";
    private static String dbName = "webproject";
    private static String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;

    public static Connection getMySQLConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(connectionURL, USER, PASS);
        return conn;
    }
}
