package com.entity;

public class Pet_order {
private int id;
private String orderId;
private String userName;
private String email;
private String phno;
private String fulladdress;
private String petName;
private String type;
private String price;
private String paymenttype;

public Pet_order() {
	super();
	
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}


public String getOrderId() {
	return orderId;
}
public void setOrderId(String orderId) {
	this.orderId = orderId;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhno() {
	return phno;
}
public void setPhno(String phno) {
	this.phno = phno;
}
public String getFulladdress() {
	return fulladdress;
}
public void setFulladdress(String fulladdress) {
	this.fulladdress = fulladdress;
}


public String getPetName() {
	return petName;
}
public void setPetName(String petName) {
	this.petName = petName;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
public String getPaymenttype() {
	return paymenttype;
}
public void setPaymenttype(String paymenttype) {
	this.paymenttype = paymenttype;
}
@Override
public String toString() {
	return "Pet_order [id=" + id + ", userName=" + userName + ", email=" + email + ", phno=" + phno + ", fulladdress="
			+ fulladdress + "]";
}


}
