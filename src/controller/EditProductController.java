package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDao;

/**
 * Servlet implementation class EditProductController
 */
@WebServlet("/EditProductController")
public class EditProductController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProductDao productdao = new ProductDao();
		HttpSession session = request.getSession();
		
		int user_id = (Integer)session.getAttribute("user_id");
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		int price = Integer.parseInt(request.getParameter("price"));
		String product_condition = request.getParameter("product_condition");
		int product_semester = Integer.parseInt(request.getParameter("product_semester"));
		String product_type= request.getParameter("product_type");
				
		boolean check = productdao.editProduct(product_id, title, description, price, product_condition, product_semester, product_type);
			
		
		response.sendRedirect("myProducts.jsp");
	}

}
