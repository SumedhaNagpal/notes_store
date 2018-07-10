package messageServer;

import java.io.IOException;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket/{parameter}")
public class WebSocketMessage {
	private static Set<Session> clients = 
		    Collections.synchronizedSet(new HashSet<Session>());
	
	 @OnMessage
	  public void onMessage(@PathParam("parameter") String param, String message, Session session) 
	    throws IOException {
	    
	    synchronized(clients){
	      // Iterate over the connected sessions
	      // and broadcast the received message
	      for(Session client : clients){
	    	  String clientParameter = client.getPathParameters().get("parameter");
	    	  System.out.println(clientParameter + " " + param); 
	        if (clientParameter.equals(param) && !session.equals(client)){
	          client.getBasicRemote().sendText(message);
	        }
	      }
	    }
	    
	  }
	 
	 @OnOpen
	  public void onOpen (@PathParam("parameter") String param, Session session) {
	  // Add session to the connected sessions set
	    clients.add(session);
	  }
	 
	 @OnClose
	  public void onClose (Session session) {
	    // Remove session from the connected sessions set
	    clients.remove(session);
	  }
}
