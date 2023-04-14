package com.DAO;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {

	public boolean addCart(Cart c);
	public List<Cart> getPetByUser(int userid);
	public boolean deletePet(int pid,int uid,int cid);
	
	
}
