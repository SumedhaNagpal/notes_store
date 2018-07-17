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
import util.PasswordUtil;

public class PaymentDao {
	
	Connection connection;
	
	public PaymentDao() {		
        try {
			connection = DBUtil.getMySqlConnection();			
		} catch (Exception e) {			
			e.printStackTrace();
		}
    }	
	
	
	public boolean addPayments(String order_id,String cust_id,String industry_type_id,String channel,int txnAmount) 
	{
		
		String query = "INSERT INTO payment(order_id,cust_id,industry_type_id,channel,txnAmount) VALUES(?,?,?,?,?)";
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(query);
			pst.setString(1, order_id);
			pst.setString(2, cust_id);
			pst.setString(3, industry_type_id);
			pst.setString(4, channel);
			pst.setInt(5, txnAmount);
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
