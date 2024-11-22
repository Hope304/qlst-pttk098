package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Diachi;


public class DiachiDAO extends BaseDAO{
	
    private static final String CREATE_DIACHI_SQL = "INSERT INTO diachi" + "  (tinh,huyen,ghichu) VALUES " +
            " (?, ?, ?);";
    private static final String UPDATE_DIACHI_SQL = "update diachi set tinh = ?,huyen= ?, ghichu =? where id = ?;";

	public int addDiachi() throws SQLException {
	    try (Connection connection = getConnection();
	         PreparedStatement ps = connection.prepareStatement(CREATE_DIACHI_SQL, PreparedStatement.RETURN_GENERATED_KEYS)) {
	    	ps.setNull(1, java.sql.Types.VARCHAR);
	        ps.setNull(2, java.sql.Types.VARCHAR);
	        ps.setNull(3, java.sql.Types.VARCHAR);
	        ps.executeUpdate();
	
	        ResultSet rs = ps.getGeneratedKeys();
	        if (rs.next()) {
	            return rs.getInt(1); // Trả về ID tài khoản mới tạo
	        }
	    }
	    return -1;  
	}
	public boolean luuDiachi(String tinh, String huyen, String ghichu, int id) throws SQLException {
		try (Connection connection = getConnection();
		      PreparedStatement ps = connection.prepareStatement(UPDATE_DIACHI_SQL)) {
	          ps.setString(1, tinh);
	          ps.setString(2, huyen);
	          ps.setString(3, ghichu);
	          ps.setInt(4, id); // ID của bản ghi muốn cập nhật

	            // Thực thi câu lệnh UPDATE
	          int rowsAffected = ps.executeUpdate();

	            // Nếu ít nhất một dòng bị ảnh hưởng, cập nhật thành công
	          return rowsAffected > 0;
	      } catch (SQLException e) {
	          e.printStackTrace();
	      }
	      return false; // Trả về false nếu có lỗi xảy ra
	}
}
