package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MessageDao;
import model.Message;

/**
 * Servlet implementation class ShowChatsController
 */
@WebServlet("/ShowChatsController")
public class ShowChatsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowChatsController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int user_id = (Integer)session.getAttribute("user_id");
		
		MessageDao messagedao = new MessageDao();
		ArrayList<Message> chatList = new ArrayList<Message>();
		chatList = messagedao.getRecentChats(user_id);
		System.out.println(chatList.size());
		session.setAttribute("chat list", chatList);
		response.sendRedirect("chatList.jsp");
	}

}
