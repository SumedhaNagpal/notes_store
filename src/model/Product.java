package model;

public class Product {
	private int product_id;
	private int user_id;
	private String title;
	private String description;
	private int price;
	private String product_condition;
	private String user_name;
	private int product_semester;
	private String product_type;
	
	public Product(int product_id,String title, String description, int price, String product_condition, String user_name, int product_semester, String product_type){
		this.product_id = product_id;
		this.title = title;
		this.description = description;
		this.price = price;
		this.product_condition = product_condition;
		this.user_name = user_name;
		this.product_semester = product_semester;
		this.product_type = product_type;
	}
	public int getProduct_semester() {
		return product_semester;
	}
	public void setProduct_semester(int product_semester) {
		this.product_semester = product_semester;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
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
				+ description + ", price=" + price + ", product_condition=" + product_condition + ", user_name="
				+ user_name + ", product_semester=" + product_semester + ", product_type=" + product_type + "]";
	}	
}
