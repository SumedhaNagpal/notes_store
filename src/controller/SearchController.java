package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDao;
import model.Product;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int user_id = (int) session.getAttribute("user_id");
		
		String keyword = request.getParameter("search");
	  	
		ProductDao productdao = new ProductDao();
		ArrayList<Product> productList = new ArrayList<Product>();
		productList = productdao.searchProducts(user_id,keyword);
		session.setAttribute("product list", productList);
//		request.setAttribute("product list", productList);
//		request.getRequestDispatcher(page).forward(request, response);
		response.sendRedirect("success.jsp?page=1");
	}

	

}
