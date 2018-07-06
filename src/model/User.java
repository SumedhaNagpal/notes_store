package model;

public class User {
	private int user_id;
	private String first_name;
	private String last_name;
	private String email;
	private String branch;
	private int current_year;
	private String password_hash;
	private String base64Image;
	
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public int getCurrent_year() {
		return current_year;
	}
	public void setCurrent_year(int current_year) {
		this.current_year = current_year;
	}
	public String getPassword_hash() {
		return password_hash;
	}
	public void setPassword_hash(String password_hash) {
		this.password_hash = password_hash;
	}
	public String getBase64Image() {
        return base64Image;
    }
 
    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", first_name=" + first_name + ", last_name=" + last_name + ", email="
				+ email + ", branch=" + branch + ", current_year=" + current_year + ", password_hash=" + password_hash + ", photo=" + base64Image + "]";
	}

	
	
}
