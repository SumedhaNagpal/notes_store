package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProductController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProductDao productdao = new ProductDao();
		
		String title = request.getParameter("title");
		String description = request.getParameter("desription");
		int price = Integer.parseInt(request.getParameter("price"));
		String condition = request.getParameter("condition");
		
		PrintWriter out = response.getWriter();
		out.print("Add product works");
		//HttpSession session = 
	}

}
