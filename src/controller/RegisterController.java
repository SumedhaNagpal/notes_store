package controller;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet("/RegistrationController")
public class RegisterController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDao userdao = new UserDao();
		
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String branch = request.getParameter("branch");
		int current_year = Integer.parseInt(request.getParameter("current_year"));
		String password_hash = request.getParameter("password_hash");
		
		if(userdao.checkUser(email)) {		//true if already registered
			response.sendRedirect("index.jsp");
		}
		else {
			if(userdao.registerUser(first_name, last_name, email, branch, current_year, password_hash))
				response.sendRedirect("welcome.jsp");
			else
				response.sendRedirect("registerpage.jsp");
		}
		
		
	}

}
