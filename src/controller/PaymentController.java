package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.PaymentDao;


/**
 * Servlet implementation class PaymentController
 */
@WebServlet("/PaymentController")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PaymentDao paymentdao = new PaymentDao();
		
		
		String order_id = request.getParameter("order_id");
		String cust_id = request.getParameter("cust_id");
		String industry_type_id = request.getParameter("industry_type_id");
		String channel = request.getParameter("channel");
		int txnAmount = Integer.parseInt(request.getParameter("txnAmount"));
		
		
		if(paymentdao.addPayments(order_id,cust_id,industry_type_id,channel,txnAmount) )
				response.sendRedirect("success.jsp");
			
		else
				response.sendRedirect("TxnTest.jsp");

	}

}
