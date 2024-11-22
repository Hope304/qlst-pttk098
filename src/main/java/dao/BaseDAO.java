package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class BaseDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/qlst";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Kết nối cơ sở dữ liệu thất bại!");
        }
    }
}