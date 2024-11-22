package web;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ThongkeKHDAO;
import model.TKKHtheoDT;

@WebServlet("/ThongkeKH")
public class ThongkeKHServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ThongkeKHDAO dao = new ThongkeKHDAO();
        // Hiển thị giao diện tìm kiếm ban đầu
    	 String startDateStr = request.getParameter("startDate");
         String endDateStr = request.getParameter("endDate");  
         request.setAttribute("startDate", startDateStr);
         request.setAttribute("endDate", endDateStr);
         Date startDate = Date.valueOf(startDateStr);
         Date endDate = Date.valueOf(endDateStr);
        List<TKKHtheoDT> customerList = dao.getTKKHtheoDT(startDate, endDate);
        request.setAttribute("customerList", customerList);
         // Lưu giá trị vào request để JSP có thể hiển thị lại
        request.getRequestDispatcher("/gdthongkeKH.jsp").forward(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ThongkeKHDAO dao = new ThongkeKHDAO();
        
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");  
        request.setAttribute("startDate", startDateStr);
        request.setAttribute("endDate", endDateStr);
        Date startDate = Date.valueOf(startDateStr);
        Date endDate = Date.valueOf(endDateStr);
        
        List<TKKHtheoDT> customerList = dao.getTKKHtheoDT(startDate, endDate);
        request.setAttribute("customerList", customerList);

        // Chuyển tiếp đến JSP
        request.getRequestDispatcher("/gdthongkeKH.jsp").forward(request, response);
    }
}
