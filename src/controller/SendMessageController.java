package controller;

import java.io.IOException;
import java.io.PrintWriter;
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int fromId = (Integer)session.getAttribute("user_id");
		
		String messageText = request.getParameter("messageText");
		int toId = Integer.parseInt(request.getParameter("toId"));
		String time = request.getParameter("time");
		
		String requestType = request.getParameter("type");
		
		MessageDao messagedao = new MessageDao();
		String roomId = messagedao.getRoom(toId, fromId);
		ArrayList<Message> messageList = new ArrayList<Message>();
		messageList = messagedao.getMessages(toId, fromId);
		System.out.println(messageText);
		if(messageText != null) {
			if(messagedao.insertMessage(toId, fromId, messageText, time)) {	
				if(requestType != null) {
					request.setAttribute("roomId", roomId);
					request.setAttribute("toId", toId);
					request.setAttribute("message list", messageList);
					request.setAttribute("message text", messageText);
					request.getRequestDispatcher("message.jsp").forward(request, response);
				}
			}
		}
		else {
			if(requestType != null) {
				request.setAttribute("roomId", roomId);
				request.setAttribute("toId", toId);
				request.setAttribute("message list", messageList);
				request.getRequestDispatcher("message.jsp").forward(request, response);
			}
			
		}
		
	}

}
