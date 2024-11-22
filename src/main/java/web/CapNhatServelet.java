package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DiachiDAO;
import dao.HotenDAO;
import dao.ThanhvienDAO;

/**
 * Servlet implementation class CapNhatServelet
 */
@WebServlet("/CapNhatKH")
public class CapNhatServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ThanhvienDAO thanhvienDAO = new ThanhvienDAO();
	private HotenDAO hotenDAO = new HotenDAO();
	private DiachiDAO diachiDAO = new DiachiDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int thanhvienId = Integer.parseInt(request.getParameter("id"));
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		String ho = request.getParameter("ho");
        String tendem = request.getParameter("tendem");
        String ten = request.getParameter("ten");
        
        String tinh = request.getParameter("tinh");
        String huyen = request.getParameter("huyen");
        String ghichu = request.getParameter("ghichu");
		try {
           int hotenId = thanhvienDAO.getIdHotenByThanhVienId(thanhvienId);
           int diachiId = thanhvienDAO.getIdDiachiByThanhVienId(thanhvienId);
           
           boolean luuhoten = hotenDAO.luuHoten(ho, tendem, ten, hotenId);
           boolean luudiachi = diachiDAO.luuDiachi(tinh, huyen, ghichu, diachiId);
           if(luudiachi && luuhoten) {
        	   thanhvienDAO.capNhatViTriKH(thanhvienId);
        	   HttpSession session = request.getSession();
               session.setAttribute("ten", ten);
               session.setAttribute("role", "Khách hàng");
        	   response.sendRedirect("gdChinhKH.jsp");
           }else {
               // Gửi thông báo lỗi về giao diện
               request.setAttribute("errorMessage", "Có lỗi xảy ra, vui lòng thử lại.");
               request.getRequestDispatcher("gdNhapthongtin.jsp").forward(request, response);
           }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
	}

}
