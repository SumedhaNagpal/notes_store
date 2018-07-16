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
 * Servlet implementation class DeleteProductController
 */
@WebServlet("/DeleteProductController")
public class DeleteProductController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		//System.out.println("in delete product controller");
		
		ProductDao productdao = new ProductDao();
		HttpSession session = request.getSession();
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		productdao.deleteProduct(product_id);
		
		response.sendRedirect("myProducts");
	}

}
