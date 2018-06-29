package dao;

import java.sql.Connection;

import util.DBUtil;

public class ProductDao {

	Connection connection;
	
	public ProductDao() {		
        try {
			connection = DBUtil.getMySqlConnection();
			//System.out.println("connection made in userdao/userdao object made");
		} catch (Exception e) {			
			e.printStackTrace();
		}
    }	
}
