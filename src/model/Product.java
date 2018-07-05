package model;

public class Product {
	private int product_id;
	private int user_id;
	private String title;
	private String description;
	private int price;
	private String product_condition;
	private String user_name;
	
	public Product(int product_id,String title, String description, int price, String condition, String user_name){
		this.product_id = product_id;
		this.title = title;
		this.description = description;
		this.price = price;
		this.product_condition = condition;
		this.user_name = user_name;
	}
	
	public Product(int product_id,String title, String description, int price, String condition){
		this.product_id = product_id;
		this.title = title;
		this.description = description;
		this.price = price;
		this.product_condition = condition;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public String getProductCondition() {
		return product_condition;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProduct_condition() {
		return product_condition;
	}
	public void setProduct_condition(String product_condition) {
		this.product_condition = product_condition;
	}
	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", user_id=" + user_id + ", title=" + title + ", description="
				+ description + ", price=" + price + ", condition=" + product_condition + "]";
	}
	
	
}
