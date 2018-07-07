package dao;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
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
	
	public boolean addProduct(int user_id, String title, String description, int price, String product_condition, int product_semester, String product_type,InputStream inputStream) {
		String query = "INSERT INTO product(user_id, title, description, price, product_condition, product_semester, product_type, pic) "
				+ "VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(query);
			pst.setInt(1, user_id);
			pst.setString(2, title);
			pst.setString(3, description);
			pst.setInt(4, price);
			pst.setString(5, product_condition);
			pst.setInt(6, product_semester);
			pst.setString(7, product_type);
			if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                pst.setBlob(8, inputStream);
            }
			
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
	
	public ArrayList<Product> showAllProducts(int user_id) {
		ArrayList<Product> productList = new ArrayList<Product>();
		String showProduct = "SELECT * FROM product INNER JOIN user ON product.user_id = user.user_id WHERE product.user_id <> " + user_id;
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(showProduct);
			ResultSet result = pst.executeQuery(showProduct);
			while(result.next()) {
				String title = result.getString("title");
				String description = result.getString("description");
				int price = result.getInt("price");
				int product_id = result.getInt("product_id");
				String product_condition = result.getString("product_condition");
				int product_semester = result.getInt("product_semester");		
				String product_type= result.getString("product_type");
				String first_name = result.getString("first_name");
				String last_name = result.getString("last_name");
				String user_name = first_name + " " + last_name;
				
				Blob blob = result.getBlob("pic");
				
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
                
       
				Product prod = new Product(product_id,title, description, price, product_condition, user_name, product_semester, product_type, base64Image);
				productList.add(prod);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return productList;
	}
	
	public ArrayList<Product> showMyProducts(int user_id, int index) {
		
		ArrayList<Product> productList = new ArrayList<Product>();
		String getMyProducts = "SELECT * FROM product WHERE product.user_id = " + user_id + " LIMIT " + (index - 1) + ", 6";
		System.out.println(getMyProducts);
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(getMyProducts);
			ResultSet result = pst.executeQuery(getMyProducts);
			while(result.next()) {
				String title = result.getString("title");
				String description = result.getString("description");
				int price = result.getInt("price");
				int product_id = result.getInt("product_id");
				String condition = result.getString("product_condition");
				Blob blob = result.getBlob("pic");
				
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
                
				Product prod = new Product(product_id,title, description, price, condition,base64Image);
				productList.add(prod);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return productList;
	}
	
	public int getMyProductCount(int user_id) {
		
		String totalCountOfMyProducts = "SELECT COUNT(product_id) FROM product WHERE product.user_id = " + user_id;
		PreparedStatement pst;
		int count = 0;
		try {
			pst = connection.prepareStatement(totalCountOfMyProducts);
			ResultSet result = pst.executeQuery(totalCountOfMyProducts);
			while(result.next()) {
				count = result.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public boolean editProduct(int product_id, String title, String description, int price, String product_condition, int product_semester, String product_type) {
		String editQuery = "UPDATE product "
				+ "SET title=?, description=?, price=?, product_condition=?, product_semester=?, product_type=?"	
				+ " WHERE product_id=?";
		
		PreparedStatement pst;
		try {
			pst = connection.prepareStatement(editQuery);
			pst.setString(1, title);
			pst.setString(2, description);
			pst.setInt(3, price);
			pst.setString(4, product_condition);
			pst.setInt(5, product_semester);
			pst.setString(6, product_type);
			pst.setInt(7, product_id);
			
			int rs = pst.executeUpdate();
			if(rs>0)
				return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	
}
