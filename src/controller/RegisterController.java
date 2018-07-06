package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.UserDao;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet("/RegistrationController")
@MultipartConfig(maxFileSize = 16177215)
public class RegisterController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDao userdao = new UserDao();
		
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String branch = request.getParameter("branch");
		int current_year = Integer.parseInt(request.getParameter("current_year"));
		String password_hash = request.getParameter("password_hash");
		
		InputStream inputStream = null; // input stream of the upload file
        
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
		
		if(userdao.checkUser(email)) {		//true if already registered
			response.sendRedirect("login.jsp");
		}
		else {
			if(userdao.registerUser(first_name, last_name, email, branch, current_year, password_hash,inputStream))
				response.sendRedirect("welcome.jsp");
			else
				response.sendRedirect("registerpage.jsp");
		}
		
		
	}

}
}
