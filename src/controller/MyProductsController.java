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
 * Servlet implementation class MyProducts
 */
@WebServlet("/MyProducts")
public class MyProductsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyProductsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int user_id = (Integer)session.getAttribute("user_id");
		
		String spageNo=request.getParameter("page");
	  	int pageNo;
	  	if(spageNo != null){
	  		pageNo =Integer.parseInt(spageNo); 
	  	}
	  	else{
	  		pageNo = 1;
	  	}
	  	int perPageCount = 6;
	  	int itemNo = 1;
	  	if(pageNo != 1){
	  		itemNo = (pageNo - 1) * perPageCount + 1;
	  	} 
		ProductDao productdao = new ProductDao();
		ArrayList<Product> productList = new ArrayList<Product>();
		productList = productdao.showMyProducts(user_id, itemNo);
		session.setAttribute("page number", pageNo);
		session.setAttribute("total count of my products", productdao.getMyProductCount(user_id));
		session.setAttribute("my product list", productList);
		response.sendRedirect("myProducts.jsp");
	}
	

}
