package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Product;
import model.User;
import dao.ProductDao;
import dao.UserDao;


/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDao userdao = new UserDao();
		
		if(userdao.authenticate(email, password)) {
			User user = userdao.getInfo(email);
			HttpSession session = request.getSession();
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("first_name", user.getFirst_name());			
			session.setAttribute("email", email);
			
			ProductDao productdao = new ProductDao();
			ArrayList<Product> productList = new ArrayList<Product>();
			productList = productdao.showProducts(user.getUser_id());
			session.setAttribute("product list", productList);
//			request.setAttribute("product list", productList);
//			request.getRequestDispatcher("success.jsp").forward(request, response);
			response.sendRedirect("success.jsp?page=1");
		
		}
		
		else {
			response.sendRedirect("login.jsp");
		}
	}

}
