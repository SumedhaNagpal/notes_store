package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBUtil;

public class UserDao {
	
	Connection connection;
	
	public UserDao() {		
        try {
			connection = DBUtil.getMySqlConnection();
			//System.out.println("connection made in userdao/userdao object made");
		} catch (Exception e) {			
			e.printStackTrace();
		}
    }	
	
	public boolean authenticate(String email, String password) {				
		try {				
			String query = "SELECT * FROM user WHERE email=? AND pw=?";
			PreparedStatement pst = connection.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			//System.out.println("Query executed in dao authenticate");
			if(rs.next()) {
				//System.out.println("rs.next in dao authenticate");
				return true;
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
				
		return false;
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
	
	
	public boolean registerUser(String first_name, String last_name, String email, String branch, int current_year, String pw) {
		String query = "INSERT INTO user VALUES(?,?,?,?,?,?)";
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(query);
			pst.setString(1, first_name);
			pst.setString(2, last_name);
			pst.setString(3, email);
			pst.setString(4, branch);
			pst.setInt(5, current_year);
			pst.setString(6, pw);
			
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
