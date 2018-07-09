package model;

public class Message {
	private int to_id;
	private int from_id;
	String message_text;
	
	public Message(int to_id, int from_id, String message_text) {
		this.to_id = to_id;
		this.from_id = from_id;
		this.message_text = message_text;
	}
	
	public String getMessageText() {
		return message_text;
	}
	
	public int getFromId() {
		return from_id;
	}
}
