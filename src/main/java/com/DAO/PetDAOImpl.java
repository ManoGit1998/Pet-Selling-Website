package com.DAO;

import java.awt.print.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.entity.PetDetails;
import com.mysql.cj.protocol.Resultset;

public class PetDAOImpl implements PetDAO {

	private Connection conn;

	public PetDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addPet(PetDetails p) {
		boolean f = false;
		try {
			String sql = "insert into pet_details(petname,type,price,petcategory,status,photo,useremail) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getPetname());
			ps.setString(2, p.getType());
			ps.setString(3, p.getPrice());
			ps.setString(4, p.getPetcategory());
			ps.setString(5, p.getStatus());
			ps.setString(6, p.getPhotoName());
			ps.setString(7, p.getEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public List<PetDetails> getAllPets() {
		List<PetDetails> list = new ArrayList<PetDetails>();
		PetDetails p = null;

		try {

			String sql = "select * from pet_details";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new PetDetails();
				p.setPetid(rs.getInt(1));
				p.setPetname(rs.getString(2));
				p.setType(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setPetcategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));

				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public PetDetails getPetById(int id) {

		PetDetails p = null;

		try {

			String sql = "select *from pet_details where petid=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				p = new PetDetails();
				p.setPetid(rs.getInt(1));
				p.setPetname(rs.getString(2));
				p.setType(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setPetcategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;
	}

	public boolean updateEditPets(PetDetails p) {
		boolean f = false;

		try {
			String sql = "update pet_details set petname=?,type=?,price=?,status=? where petid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getPetname());
			ps.setString(2, p.getType());
			ps.setString(3, p.getPrice());
			ps.setString(4, p.getStatus());
			ps.setInt(5, p.getPetid());

			PetDAOImpl dao = new PetDAOImpl(DBConnect.getConn());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deletePets(int id) {

		boolean f = false;

		try {

			String sql = "delete from pet_details where petid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<PetDetails> getNewPet() {

		List<PetDetails> list = new ArrayList<PetDetails>();
		PetDetails p = null;

		try {
			String sql = "select * from pet_details where petcategory=? and status=? order by petid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new PetDetails();
				p.setPetid(rs.getInt(1));
				p.setPetname(rs.getString(2));
				p.setType(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setPetcategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<PetDetails> getRecentPet() {

		List<PetDetails> list = new ArrayList<PetDetails>();
		PetDetails p = null;

		try {
			String sql = "select * from pet_details where status=? order by petid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new PetDetails();
				p.setPetid(rs.getInt(1));
				p.setPetname(rs.getString(2));
				p.setType(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setPetcategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<PetDetails> getOldPet() {

		List<PetDetails> list = new ArrayList<PetDetails>();
		PetDetails p = null;

		try {
			String sql = "select * from pet_details where petcategory=? and status=? order by petid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new PetDetails();
				p.setPetid(rs.getInt(1));
				p.setPetname(rs.getString(2));
				p.setType(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setPetcategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<PetDetails> getAllRecentPets() {
		List<PetDetails> list = new ArrayList<PetDetails>();
		PetDetails p = null;

		try {
			String sql = "select * from pet_details where status=? order by petid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new PetDetails();
				p.setPetid(rs.getInt(1));
				p.setPetname(rs.getString(2));
				p.setType(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setPetcategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<PetDetails> getAllNewPets() {
		List<PetDetails> list = new ArrayList<PetDetails>();
		PetDetails p = null;

		try {
			String sql = "select * from pet_details where petcategory=? and status=? order by petid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new PetDetails();
				p.setPetid(rs.getInt(1));
				p.setPetname(rs.getString(2));
				p.setType(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setPetcategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<PetDetails> getAllOldPets() {
		List<PetDetails> list = new ArrayList<PetDetails>();
		PetDetails p = null;

		try {
			String sql = "select * from pet_details where petcategory=? and status=? order by petid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new PetDetails();
				p.setPetid(rs.getInt(1));
				p.setPetname(rs.getString(2));
				p.setType(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setPetcategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<PetDetails> getPetByOld(String email, String cate) {

		{

			List<PetDetails> list = new ArrayList<PetDetails>();
			PetDetails p = null;

			try {
				
				String sql="select * from pet_details where petcategory=? and useremail=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				
				ps.setString(1, cate);
				ps.setString(2, email);
				ResultSet rs=ps.executeQuery();
                  while(rs.next())
                  {
                	  p=new PetDetails();
                	  
                	
      				p.setPetid(rs.getInt(1));
      				p.setPetname(rs.getString(2));
      				p.setType(rs.getString(3));
      				p.setPrice(rs.getString(4));
      				p.setPetcategory(rs.getString(5));
      				p.setStatus(rs.getString(6));
      				p.setPhotoName(rs.getString(7));
      				p.setEmail(rs.getString(8));
      				
      				list.add(p);
                  }

			} catch (Exception e) {
				e.printStackTrace();
			}

		
		return list;
	}

		
		
}

	public boolean oldPetDelete(String email, String cate,int id) {
		boolean f=false;
		try {
			
			String sql="delete from pet_details where petcategory=? and useremail=? and petid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, cate);
			ps.setString(2, email);
			ps.setInt(3, id);
			
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;

	}

	public List<PetDetails> getPetBySearch(String ch) {

		List<PetDetails> list = new ArrayList<PetDetails>();
		PetDetails p = null;

		try {
			
         	String sql="select * from pet_details where petname like ? or type like ? or petcategory like ? and status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			ResultSet rs=ps.executeQuery();
              while(rs.next())
              {
            	  p=new PetDetails();
            	  
            	
  				p.setPetid(rs.getInt(1));
  				p.setPetname(rs.getString(2));
  				p.setType(rs.getString(3));
  				p.setPrice(rs.getString(4));
  				p.setPetcategory(rs.getString(5));
  				p.setStatus(rs.getString(6));
  				p.setPhotoName(rs.getString(7));
  				p.setEmail(rs.getString(8));
  				
  				list.add(p);
              }

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;		
	}
}
