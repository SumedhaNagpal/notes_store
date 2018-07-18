package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PaymentDao;
import dao.ProductDao;


/**
 * Servlet implementation class PaymentController
 */
@WebServlet("/PaymentController")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PaymentDao paymentdao = new PaymentDao();
		
		String order_id = request.getParameter("ORDER_ID");
		String cust_id = request.getParameter("CUST_ID");
		String industry_type_id = request.getParameter("INDUSTRY_TYPE_ID");
		String channel = request.getParameter("CHANNEL_ID");
		int txnAmount = Integer.parseInt(request.getParameter("TXN_AMOUNT"));
		
		HttpSession session=request.getSession();
		
		int current_product_id = (int) session.getAttribute("current_product_id");
		
		ProductDao productdao = new ProductDao();
		
		request.setAttribute("ORDER_ID", order_id);
		request.setAttribute("CUST_ID", cust_id);
		request.setAttribute("INDUSTRY_TYPE_ID", industry_type_id);
		request.setAttribute("CHANNEL_ID", channel);
		request.setAttribute("TXN_AMOUNT", txnAmount);
		
		
		if(paymentdao.addPayments(order_id,cust_id,industry_type_id,channel,txnAmount))
		{
			productdao.updateProductStatus(current_product_id);
			request.getRequestDispatcher("pgRedirect.jsp").forward(request, response);
		}
				
		else
			response.sendRedirect("TxnTest.jsp");
		
			
	}

}
