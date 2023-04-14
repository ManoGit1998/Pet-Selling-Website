package com.DAO;

import java.util.List;

import com.entity.PetDetails;

public interface PetDAO {

	public  boolean addPet(PetDetails p);
	
	public List<PetDetails> getAllPets();
	
	public PetDetails getPetById(int id);
	
	public boolean updateEditPets(PetDetails p);
	
	public boolean deletePets(int id);
	
	public List<PetDetails> getNewPet();
	
	public List<PetDetails> getRecentPet();
	
	public List<PetDetails> getOldPet();
	
	public List<PetDetails> getAllRecentPets();
	
	public List<PetDetails> getAllNewPets();
	
	public List<PetDetails> getAllOldPets();
	
	public List<PetDetails> getPetByOld(String email,String cate);
	
	public boolean oldPetDelete(String email,String cate,int id);
	
	public List<PetDetails> getPetBySearch(String ch);
	
	
}
