package web;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiachiDAO;
import dao.HotenDAO;
import dao.TaikhoanDAO;
import dao.ThanhvienDAO;
import model.Taikhoan;
import model.Thanhvien;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private TaikhoanDAO taikhoanDAO = new TaikhoanDAO();
    private ThanhvienDAO thanhvienDAO = new ThanhvienDAO();
    private HotenDAO hotenDAO = new HotenDAO();
    private DiachiDAO diachiDAO = new DiachiDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        try {
            // Kiểm tra tên đăng nhập có tồn tại chưa
            if (taikhoanDAO.isUsernameExists(username)) {
                // Nếu tên đăng nhập đã tồn tại, trả về thông báo lỗi và quay lại trang đăng ký
                request.setAttribute("errorMessage", "Tên đăng nhập đã tồn tại. Vui lòng chọn tên khác.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Tạo tài khoản
            Taikhoan taikhoan = new Taikhoan(0, username, password);
            int idTaikhoan = taikhoanDAO.addTaikhoan(taikhoan);

            if (idTaikhoan == -1) {
                // Nếu có lỗi khi tạo tài khoản, trả về trang đăng ký với thông báo lỗi
                request.setAttribute("errorMessage", "Đã xảy ra lỗi khi tạo tài khoản. Vui lòng thử lại.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            int idHoten = hotenDAO.addHoten();
            int idDiachi = diachiDAO.addDiachi();
            // Thêm thông tin thành viên
            Thanhvien thanhvien = new Thanhvien(phone, email, idTaikhoan,idHoten,idDiachi);
            boolean success = thanhvienDAO.addThanhvien(thanhvien);

            if (success) {
                // Nếu đăng ký thành công, chuyển hướng đến trang đăng nhập
                response.sendRedirect("login.jsp");
            } else {
                // Nếu không thêm được thành viên, quay lại trang đăng ký với thông báo lỗi
                request.setAttribute("errorMessage", "Đã xảy ra lỗi khi thêm thông tin thành viên. Vui lòng thử lại.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");  // Nếu có lỗi xảy ra trong quá trình xử lý, chuyển đến trang lỗi
        }
    }
}
