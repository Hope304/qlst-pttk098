package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.TKKHtheoDT;
import java.text.DecimalFormat;
public class ThongkeKHDAO extends BaseDAO {

	public List<TKKHtheoDT> getTKKHtheoDT(Date startDate, Date endDate) {
		List<TKKHtheoDT> tkkh = new ArrayList<>();
		DecimalFormat df = new DecimalFormat("#,###,###");
		String query = "SELECT " +
                "    hoadon.KH_id, " +
                "    ht.ho, " +
                "    ht.tendem, " +
                "    ht.ten, " +
                "    SUM(hoadon.tongtien) AS total_revenue " +
                "FROM ( " +
                "    SELECT g.KH_id, g.tongtien " +
                "    FROM hoadonon h " +
                "    JOIN giohang g ON h.giohang_id = g.id " +
                "    WHERE h.ngaymua BETWEEN ? AND ? " +
                "    UNION ALL " +
                "    SELECT g.KH_id, g.tongtien " +
                "    FROM hoadonoff h " +
                "    JOIN giohang g ON h.giohang_id = g.id " +
                "    WHERE h.ngaymua BETWEEN ? AND ? " +
                ") hoadon " +
                "JOIN thanhvien tv ON hoadon.KH_id = tv.id " +
                "JOIN hoten ht ON tv.hoten_id = ht.id " +
                "GROUP BY hoadon.KH_id, ht.ho, ht.tendem, ht.ten " +
                "ORDER BY total_revenue DESC;";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
             
            // Set giá trị cho câu lệnh SQL
            preparedStatement.setDate(1, startDate);
            preparedStatement.setDate(2, endDate);
            preparedStatement.setDate(3, startDate);
            preparedStatement.setDate(4, endDate);
            // Thực thi câu lệnh
            ResultSet rs =  preparedStatement.executeQuery();
            while (rs.next()) {
            	TKKHtheoDT hoadon = new TKKHtheoDT();
                hoadon.setKH_id(rs.getInt("KH_id"));
                hoadon.setTongtien(df.format(rs.getFloat("total_revenue")));
                hoadon.setHo(rs.getString("ho"));
                hoadon.setTendem(rs.getString("tendem"));
                hoadon.setTen(rs.getString("ten"));
                tkkh.add(hoadon);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tkkh;
    }
	public List<TKKHtheoDT> getInvoicesByCustomer(int customerId, Date startDate, Date endDate ) {
	    List<TKKHtheoDT> invoiceList = new ArrayList<>();
	    DecimalFormat df = new DecimalFormat("#,###,###");
	    String sql = "SELECT hoadon.id AS hoadon_id, hoadon.tongtien, hoadon.loai_hoadon " +
                "FROM (" +
                    "SELECT h.id, 'on' AS loai_hoadon, g.KH_id, g.tongtien " +
                    "FROM hoadonon h " +
                    "JOIN giohang g ON h.giohang_id = g.id " +
                    "WHERE g.KH_id = ? AND h.ngaymua BETWEEN ? AND ? " + // Chú ý dấu cách giữa AND và điều kiện
                    "UNION ALL " +
                    "SELECT h.id, 'off' AS loai_hoadon, g.KH_id, g.tongtien " +
                    "FROM hoadonoff h " +
                    "JOIN giohang g ON h.giohang_id = g.id " +
                    "WHERE g.KH_id = ? AND h.ngaymua BETWEEN ? AND ? " + // Chú ý dấu cách giữa AND và điều kiện
                ") hoadon " +
                "ORDER BY hoadon.id DESC";

	    try (Connection connection = getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	        preparedStatement.setInt(1, customerId);
	        preparedStatement.setDate(2, startDate);
            preparedStatement.setDate(3, endDate);
	        preparedStatement.setInt(4, customerId);
            preparedStatement.setDate(5, startDate);
            preparedStatement.setDate(6, endDate);
	        ResultSet rs = preparedStatement.executeQuery();
	        while (rs.next()) {
	            TKKHtheoDT invoice = new TKKHtheoDT();
	            invoice.setHD_id(rs.getInt("hoadon_id"));
	            invoice.setTongtien(df.format(rs.getFloat("tongtien")));
	            invoice.setLoai(rs.getString("loai_hoadon"));
	            invoiceList.add(invoice);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return invoiceList;
	}

}
