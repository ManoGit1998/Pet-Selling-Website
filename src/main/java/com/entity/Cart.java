package com.entity;

public class Cart {

	public int getPid() {
		return pid;
	
	
	
	}
	private int cid;
	private int pid;
	private int uid;
	private String petname;
	private String type;
	private Double price;
	private Double totalPrice;
	public int getCid() {
		return cid;
	}
	
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getPetname() {
		return petname;
	}
	public void setPetname(String petname) {
		this.petname = petname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
		
	
}
