package dao;

import java.sql.Connection;
import java.sql.Blob;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import model.User;
import util.DBUtil;

public class UserDao {
	
	Connection connection;
	
	public UserDao() {		
        try {
			connection = DBUtil.getMySqlConnection();			
		} catch (Exception e) {			
			e.printStackTrace();
		}
    }	
	
	public boolean authenticate(String email, String password) {				
		try {				
			String query = "SELECT * FROM user WHERE email=? AND password_hash=?";
			PreparedStatement pst = connection.prepareStatement(query);			
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();			
			if(rs.next()) {				
				return true;
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
				
		return false;
	}
	
	public User getInfo(String email) throws IOException{		
		String query = "SELECT user_id, first_name, last_name, branch, current_year, password_hash, photo FROM user WHERE email = ?";		
		try {
			PreparedStatement pst = connection.prepareStatement(query);			
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();			
			if(rs.next()) {
				User user = new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setFirst_name(rs.getString("first_name"));
				user.setLast_name(rs.getString("last_name"));
				user.setEmail(email);
				user.setBranch(rs.getString("branch"));
				user.setCurrent_year(rs.getInt("current_year"));
				user.setPassword_hash(rs.getString("password_hash"));
				Blob blob = rs.getBlob("photo");
				
				InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                 
                inputStream.close();
                outputStream.close();
                
                user.setBase64Image(base64Image);
				return user;
			}
		} catch (SQLException e ) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return null;		
	}
	
	//returns true if email already registered
	public boolean checkUser(String email) {				
		String query = "SELECT * FROM user WHERE email=?";
		try {
			PreparedStatement pst = connection.prepareStatement(query);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) 
				return true;				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	public boolean registerUser(String first_name, String last_name, String email, String branch, int current_year, String password_hash, InputStream inputStream) {
		String query = "INSERT INTO user(first_name, last_name, email, branch, current_year, password_hash, photo) VALUES(?,?,?,?,?,?,?)";
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(query);
			pst.setString(1, first_name);
			pst.setString(2, last_name);
			pst.setString(3, email);
			pst.setString(4, branch);
			pst.setInt(5, current_year);
			pst.setString(6, password_hash);
			if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                pst.setBlob(7, inputStream);
            }
			
			int num = pst.executeUpdate();
			if(num>0)
				return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
		
}
