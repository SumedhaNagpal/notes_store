package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Product;
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
	
	public boolean addProduct(int user_id, String title, String description, int price, String product_condition) {
		String query = "INSERT INTO product(user_id, title, description, price, product_condition) VALUES(?,?,?,?,?)";
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(query);
			pst.setInt(1, user_id);
			pst.setString(2, title);
			pst.setString(3, description);
			pst.setInt(4, price);
			pst.setString(5, product_condition);
			
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
	
	public ArrayList<Product> showProducts(int user_id) {
		ArrayList<Product> productList = new ArrayList<Product>();
		String showProduct = "SELECT * FROM product WHERE user_id <> " + user_id;
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(showProduct);
			ResultSet result = pst.executeQuery(showProduct);
			while(result.next()) {
				String title = result.getString("title");
				String description = result.getString("description");
				int price = result.getInt("price");
				Product prod = new Product(title, description, price);
				productList.add(prod);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return productList;
	}
}
