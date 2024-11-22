package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HotenDAO;
import dao.TaikhoanDAO;
import dao.ThanhvienDAO;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private TaikhoanDAO taikhoanDAO = new TaikhoanDAO();
    private ThanhvienDAO thanhvienDAO = new ThanhvienDAO();
    private HotenDAO hotenDao = new HotenDAO();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng đến trang đăng nhập
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            int taikhoanId = taikhoanDAO.validateLogin(username, password); // Lấy ID tài khoản sau khi kiểm tra đăng nhập
            int thanhvienId = thanhvienDAO.getThanhVienIdByTaiKhoanId(taikhoanId);
            int hotenId = thanhvienDAO.getIdHotenByThanhVienId(thanhvienId);
            String ten = hotenDao.layTenTheoId(hotenId);
            if (taikhoanId != -1) {
                // Lấy vai trò từ bảng Thanhvien
                String role = thanhvienDAO.getRoleByTaikhoanId(taikhoanId);
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);
                session.setAttribute("id", thanhvienId);
                if(ten != null) {
                	session.setAttribute("ten", ten);
                }
//                response.sendRedirect("gdChinhQL.jsp");
                
//                 Chuyển hướng tới trang chính
                if ("NV Quản lý".equals(role)) {
                    response.sendRedirect("gdChinhQL.jsp");
                } else if ("Khách hàng".equals(role) || "Người dùng".equals(role)){
                	response.sendRedirect("gdChinhKH.jsp");
                }
            } else {
                // Đăng nhập thất bại, quay lại trang đăng nhập với thông báo lỗi
                request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}