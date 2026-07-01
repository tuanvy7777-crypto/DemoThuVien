package uef.edu.vn.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DBConfig {
    private static final String URL = "jdbc:mysql://sql12.freesqldatabase.com:3306/sql12831996?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Ho_Chi_Minh";
    private static final String USERNAME = "sql12831996";
    private static final String PASSWORD = "nT3KgwLdBk";

    private DBConfig() {
    }

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            throw new SQLException("MySQL JDBC Driver not found", ex);
        }
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}
