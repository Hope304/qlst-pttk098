package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Taikhoan;

public class TaikhoanDAO extends BaseDAO{
	private static final String INSERT_TAIKHOAN_SQL = "INSERT INTO taikhoan (username, password) VALUES (?, ?)";
    private static final String CHECK_USERNAME_SQL = "SELECT id FROM taikhoan WHERE username = ?";
    private static final String LOGIN_SQL = "SELECT * FROM taikhoan WHERE username = ? AND password = ?";
    
    // Kiểm tra username đã tồn tại hay chưa
    public boolean isUsernameExists(String username) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(CHECK_USERNAME_SQL)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // Nếu có bản ghi trả về, username đã tồn tại
        }
    }

    // Thêm tài khoản mới (sau khi kiểm tra username)
    public int addTaikhoan(Taikhoan taikhoan) throws SQLException {
        if (isUsernameExists(taikhoan.getUsername())) {
            return -1; // Username đã tồn tại
        }

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_TAIKHOAN_SQL, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, taikhoan.getUsername());
            ps.setString(2, taikhoan.getPassword());
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Trả về ID tài khoản mới tạo
            }
        }
        return -1; 
        
    }
 // Kiểm tra thông tin đăng nhập
    public int validateLogin(String username, String password) {
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(LOGIN_SQL)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("id"); // Trả về ID tài khoản nếu đăng nhập thành công
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
}
