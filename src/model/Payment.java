package model;

public class Payment {
	
	private String order_id;
	private String cust_id;
	private String industry_type_id;
	private String channel;
	private int txnAmount;

	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	
	public String getIndustry_type_id() {
		return industry_type_id;
	}
	public void setIndustry_type_id(String industry_type_id) {
		this.industry_type_id = industry_type_id;
	}
	
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public int getTxnAmount() {
		return txnAmount;
	}
	public void setTxnAmount(int txnAmount) {
		this.txnAmount = txnAmount;
	}
	

}
