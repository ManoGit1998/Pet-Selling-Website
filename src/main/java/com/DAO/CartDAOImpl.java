package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {

	private Connection conn;
	public CartDAOImpl(Connection conn)
	{
		this.conn=conn;
	}
	
	
	public boolean addCart(Cart c) {
		
		
		boolean f=false;
		try {
			
			String sql="insert into cart(pid,uid,petname,type,price,total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setInt(1, c.getPid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getPetname());
			ps.setString(4, c.getType());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
}


	public List<Cart> getPetByUser(int userid) {
		
		List<Cart> list=new ArrayList<Cart>();
      
		Cart c=null;
		double totalPrice=0;
		try {
			
			String sql="select * from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, userid);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setPid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setPetname(rs.getString(4));
				c.setType(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				totalPrice=totalPrice+rs.getDouble(7);
				c.setTotalPrice(totalPrice);
				
				list.add(c);
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}


	public boolean deletePet(int pid,int uid,int cid) {
		boolean f=false;
		try {
			
			String sql="delete from cart where pid=? and uid=? and cid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return f;
	}
	

}
