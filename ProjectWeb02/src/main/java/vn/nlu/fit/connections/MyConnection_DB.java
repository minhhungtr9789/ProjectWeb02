package vn.nlu.fit.connections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection_DB {
    private static String USER = "root";
    private static String PASS = "";

    private static String hostName = "localhost";
    private static String dbName = "webproject";
    private static String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;

    public static Connection getConnection() {

        final String url = "jdbc:mysql://localhost:3306/demo?useSSL=false&useUnicode=true&characterEncoding=utf-8";
        final String user = "root";
        final String password = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                return DriverManager.getConnection(connectionURL, user, password);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }


    public static void main(String[] args) throws Exception {


    }

}
