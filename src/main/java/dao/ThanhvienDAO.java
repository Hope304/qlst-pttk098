package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Thanhvien;

public class ThanhvienDAO extends BaseDAO {
    private static final String INSERT_THANHVIEN_SQL = "INSERT INTO thanhvien (taikhoan_id,hoten_id,diachi_id,sdt ,gmail, vitri) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_THANHVIEN_BY_ID_TAIKHOAN = "SELECT * FROM thanhvien WHERE id_taikhoan = ?";
    private static final String GET_ROLE_SQL = "SELECT vitri FROM thanhvien WHERE taikhoan_id = ?";
    // Thêm thông tin thành viên
    public boolean addThanhvien(Thanhvien thanhvien) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_THANHVIEN_SQL)) {
            ps.setInt(1, thanhvien.getTaikhoan_id());
            ps.setInt(2, thanhvien.getHoten_id());
            ps.setInt(3, thanhvien.getDiachi_id());
            ps.setString(4, thanhvien.getSdt());
            ps.setString(5, thanhvien.getGmail());
            ps.setString(6, "Người dùng");
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }
    
    public String getRoleByTaikhoanId(int taikhoanId) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(GET_ROLE_SQL)) {
            ps.setInt(1, taikhoanId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("vitri"); // Trả về vai trò của thành viên
            }
        }
        return null; // Trả về null nếu không tìm thấy vai trò
    }
    
    public int getIdHotenByThanhVienId(int idThanhVien) {
        String sql = "SELECT hoten_id FROM thanhvien WHERE id = ?";
        int idHoten = -1; // Giá trị mặc định nếu không tìm thấy

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idThanhVien);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    idHoten = rs.getInt("hoten_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idHoten; // Trả về id_hoten
    }

    // Phương thức lấy id_diachi từ id_thanhvien
    public int getIdDiachiByThanhVienId(int idThanhVien) {
        String sql = "SELECT diachi_id FROM thanhvien WHERE id = ?";
        int idDiachi = -1; // Giá trị mặc định nếu không tìm thấy

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idThanhVien);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    idDiachi = rs.getInt("diachi_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idDiachi; // Trả về id_diachi
    }
    
    public int getThanhVienIdByTaiKhoanId(int idTaiKhoan) {
        String sql = "SELECT id FROM thanhvien WHERE taikhoan_id = ?";
        int idThanhVien = -1; // Giá trị mặc định nếu không tìm thấy

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idTaiKhoan);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    idThanhVien = rs.getInt("id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idThanhVien; // Trả về id_thanhvien
    }
    
    public void capNhatViTriKH(int id) {
        String sql = "UPDATE ThanhVien SET vitri = ? WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
             
            // Set giá trị cho câu lệnh SQL
            preparedStatement.setString(1, "Khách hàng");
            preparedStatement.setInt(2, id);
            // Thực thi câu lệnh
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy thông tin thành viên theo ID tài khoản
//    public Thanhvien getThanhvienByTaikhoanId(int idTaikhoan) throws SQLException {
//        try (Connection connection = getConnection();
//             PreparedStatement ps = connection.prepareStatement(SELECT_THANHVIEN_BY_ID_TAIKHOAN)) {
//            ps.setInt(1, idTaikhoan);
//            ResultSet rs = ps.executeQuery();
//
//            if (rs.next()) {
//                return new Thanhvien(
//                    rs.getInt("id"),
//                    rs.getInt("id_taikhoan"),
//                    rs.getString("email"),
//                    rs.getString("full_name"),
//                    rs.getString("phone")
//                );
//            }
//        }
//        return null; // Nếu không tìm thấy
//    }
}
