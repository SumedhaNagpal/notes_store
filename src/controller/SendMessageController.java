package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MessageDao;

/**
 * Servlet implementation class MessageController
 */
@WebServlet("/Message")
public class SendMessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessageController() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int fromId = (Integer)session.getAttribute("user_id");
		
		String messageText = request.getParameter("messageText");
		int toId = Integer.parseInt(request.getParameter("toId"));
		
		MessageDao messagedao = new MessageDao();
		String roomId = messagedao.getRoom(toId, fromId);
		if(messagedao.insertMessage(toId, fromId, messageText)) {			
			request.setAttribute("roomId", roomId);
			request.getRequestDispatcher("message.jsp").forward(request, response);;
		}
		
	}

}
