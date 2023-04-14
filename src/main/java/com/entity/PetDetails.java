package com.entity;

public class PetDetails {

	private int petid;
	private String petname;
	private String type;
	private String price;
	private String petcategory;
	private String status;
	private String photoName;
	private String email;

	public PetDetails(String petname, String type, String price, String petcategory, String status, String photoName,
			String email) {
		super();
		this.petname = petname;
		this.type = type;
		this.price = price;
		this.petcategory = petcategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}

	public PetDetails() {
		// TODO Auto-generated constructor stub
	}

	public int getPetid() {
		return petid;
	}

	public void setPetid(int petid) {
		this.petid = petid;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPetcategory() {
		return petcategory;
	}

	public void setPetcategory(String petcategory) {
		this.petcategory = petcategory;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "PetDetails [petid=" + petid + ", petname=" + petname + ", type=" + type + ", price=" + price
				+ ", petcategory=" + petcategory + ", status=" + status + ", photoName=" + photoName + ", email="
				+ email + "]";
	}

}
