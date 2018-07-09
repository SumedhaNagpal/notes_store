package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;

import model.Message;
import model.Product;
import util.DBUtil;

public class MessageDao {
Connection connection;
	
	public MessageDao() {		
        try {
			connection = DBUtil.getMySqlConnection();
			//System.out.println("connection made in userdao/userdao object made");
		} catch (Exception e) {			
			e.printStackTrace();
		}
    }
	
	public boolean insertMessage(int to_id, int from_id, String messageText, String time) {
		String query = "INSERT INTO message(to_id, from_id, message_text, message_time) "
				+ "VALUES(?,?,?,?)";
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(query);
			pst.setInt(1, to_id);
			pst.setInt(2, from_id);
			pst.setString(3, messageText);
			pst.setString(4, time);
			int num = pst.executeUpdate();
			if(num>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
	}
	
	public String getRoom(int toId, int fromId) {
		String checkExistingRoom = "SELECT * FROM room WHERE (person1 = '" + toId + "' AND person2 ='" + fromId + "') OR (person1 = '" + fromId + "' AND person2 ='" + toId + "')";
		PreparedStatement pst;
		String room = "";
		try {
			pst = connection.prepareStatement(checkExistingRoom);
			ResultSet result = pst.executeQuery(checkExistingRoom);
			if(result.next() == false) {
				room = createNewRoom(toId, fromId);
			}
			else {
				do {
					room = result.getString("room_id");
				}while(result.next());
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return room;
	}
	
	public String createNewRoom(int toId, int fromId) {
		String newRoom = "INSERT INTO room(room_id, person1, person2) "
				+ "VALUES(?,?,?)";
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(newRoom);
			String roomId = UUID.randomUUID().toString();
			
			pst.setString(1, roomId);
			pst.setInt(2, toId);
			pst.setInt(3, fromId);
			int num = pst.executeUpdate();
			if(num>0) {
				return roomId;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<Message> getMessages(int toId, int fromId) {
		ArrayList<Message> messageList = new ArrayList<Message>();
		String checkExistingRoom = "SELECT * FROM message WHERE (to_id = '" + toId + "' AND from_id ='" + fromId + "') OR (to_id = '" + fromId + "' AND from_id ='" + toId + "') ORDER BY message_time";
		PreparedStatement pst;
	
		try {
			pst = connection.prepareStatement(checkExistingRoom);
			ResultSet result = pst.executeQuery(checkExistingRoom);
			while(result.next()) {
				int to_id = result.getInt("to_id");
				int from_id = result.getInt("from_id");
				String message_text = result.getString("message_text");
				
				Message message = new Message(to_id, from_id, message_text);
				messageList.add(message);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return messageList;
	}
	
}
