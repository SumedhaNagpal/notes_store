package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDao;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProductController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProductDao productdao = new ProductDao();
		HttpSession session = request.getSession();
		
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		int price = Integer.parseInt(request.getParameter("price"));
		String product_condition = request.getParameter("product_condition");
		int product_semester = Integer.parseInt(request.getParameter("product_semester"));
		String product_type= request.getParameter("product_type");
		
		int user_id = (Integer)session.getAttribute("user_id");
		
		
		if(productdao.addProduct(user_id, title, description, price, product_condition, product_semester, product_type)) {			
			PrintWriter out = response.getWriter();
			out.print("Add product works");
			response.sendRedirect("products.jsp");
		}
		
		else {
			response.sendRedirect("sell.jsp");
		}
		//HttpSession session = 
	}

}
