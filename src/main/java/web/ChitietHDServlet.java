package web;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TKKHtheoDT;
import dao.ThongkeKHDAO;


/**
 * Servlet implementation class ChitietHD
 */
@WebServlet("/ChitietHD")
public class ChitietHDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ThongkeKHDAO dao = new ThongkeKHDAO();
	    String customerIdStr = request.getParameter("customerId");
	    String startDateStr = request.getParameter("startDate");
	    String endDateStr = request.getParameter("endDate");
	    int customerId = Integer.parseInt(customerIdStr);
	    Date startDate = Date.valueOf(startDateStr);
        Date endDate = Date.valueOf(endDateStr);
	    List<TKKHtheoDT> invoiceList = dao.getInvoicesByCustomer(customerId,startDate, endDate);
	    
	    request.setAttribute("selectedCustomerId", customerId);
	    request.setAttribute("invoiceList", invoiceList);
	    request.setAttribute("startDate", startDate);
	    request.setAttribute("endDate", endDate);

	    request.getRequestDispatcher("/gdhoadonKH.jsp").forward(request, response);
	}


}
