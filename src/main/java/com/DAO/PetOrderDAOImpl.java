package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Pet_order;
import com.mysql.cj.protocol.Resultset;


public class PetOrderDAOImpl implements PetOrderDAO {

	private Connection conn;

	public PetOrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	public boolean saveOrder(List<Pet_order> plist) {
		boolean f = false;

		try {

			String sql = "insert into pet_order(order_id,user_name,email,address,phone,pet_name,type,price,payment) values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			for (Pet_order p : plist) {
				ps.setString(1, p.getOrderId());
				ps.setString(2, p.getUserName());
				ps.setString(3, p.getEmail());
				ps.setString(4, p.getFulladdress());
				ps.setString(5, p.getPhno());
				ps.setString(6, p.getPetName());
				ps.setString(7, p.getType());
				ps.setString(8, p.getPrice());
				ps.setString(9, p.getPaymenttype());

				ps.addBatch();
			}

			int[] cout = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Pet_order> getPet(String email) {
		List<Pet_order> list=new ArrayList<Pet_order>();
		
		Pet_order o=null;
		try {
			
		String sql="select * from pet_order where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
			 o=new Pet_order();
			 o.setId(rs.getInt(1));
			 o.setOrderId(rs.getString(2));
			 o.setUserName(rs.getString(3));
			 o.setEmail(rs.getString(4));
			 o.setFulladdress(rs.getString(5));
			 o.setPhno(rs.getString(6));
			 o.setPetName(rs.getString(7));
			 o.setType(rs.getString(8));
			 o.setPrice(rs.getString(9));
			 o.setPaymenttype(rs.getString(10));
			 list.add(o);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	public List<Pet_order> getAllPet() {
List<Pet_order> list=new ArrayList<Pet_order>();
		
		Pet_order o=null;
		try {
			
		String sql="select * from pet_order";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
			 o=new Pet_order();
			 o.setId(rs.getInt(1));
			 o.setOrderId(rs.getString(2));
			 o.setUserName(rs.getString(3));
			 o.setEmail(rs.getString(4));
			 o.setFulladdress(rs.getString(5));
			 o.setPhno(rs.getString(6));
			 o.setPetName(rs.getString(7));
			 o.setType(rs.getString(8));
			 o.setPrice(rs.getString(9));
			 o.setPaymenttype(rs.getString(10));
			 list.add(o);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	

}
