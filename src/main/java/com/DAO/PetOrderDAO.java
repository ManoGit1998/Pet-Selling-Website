package com.DAO;

import java.util.List;

import com.entity.Pet_order;

public interface PetOrderDAO{
	

	
	public boolean saveOrder(List<Pet_order> p);
	
	public List<Pet_order> getPet(String email);
	
	public List<Pet_order> getAllPet();

}
