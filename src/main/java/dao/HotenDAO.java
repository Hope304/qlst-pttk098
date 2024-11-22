package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Hoten;

public class HotenDAO extends BaseDAO{
	
    private static final String CREATE_HOTEN_SQL = "INSERT INTO hoten" + "  (ho,tendem,ten) VALUES " +
            " (?, ?, ?);";
    private static final String UPDATE_HOTEN_SQL = "update hoten set ho = ?,tendem= ?, ten =? where id = ?;";

	public int addHoten() throws SQLException {
	    try (Connection connection = getConnection();
	         PreparedStatement ps = connection.prepareStatement(CREATE_HOTEN_SQL, PreparedStatement.RETURN_GENERATED_KEYS)) {
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
	public String layTenTheoId(int idHoten) {
	    String sql = "SELECT ten FROM Hoten WHERE id = ?";
	    try (Connection connection = getConnection();
	         PreparedStatement ps = connection.prepareStatement(sql)) {
	         
	        ps.setInt(1, idHoten); // Thiết lập giá trị cho tham số `idHoten`

	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            return rs.getString("ten"); // Lấy giá trị cột "ten"
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null; // Trả về null nếu không tìm thấy
	}

	
	public boolean luuHoten(String ho, String tendem, String ten, int id) throws SQLException {
		try (Connection connection = getConnection();
		      PreparedStatement ps = connection.prepareStatement(UPDATE_HOTEN_SQL)) {
	          ps.setString(1, ho);
	          ps.setString(2, tendem);
	          ps.setString(3, ten);
	          ps.setInt(4, id); // ID của bản ghi muốn cập nhật
	          System.out.println(ps);
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
