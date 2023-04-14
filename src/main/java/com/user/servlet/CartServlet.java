package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.PetDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.PetDetails;
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
			int pid=Integer.parseInt(req.getParameter("pid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			
			PetDAOImpl dao=new PetDAOImpl(DBConnect.getConn());
			PetDetails p=dao.getPetById(pid);
			
			
			Cart c=new Cart();
			c.setPid(pid);
			c.setUid(uid);
			c.setPetname(p.getPetname());
			c.setType(p.getType());
			c.setPrice(Double.parseDouble(p.getPrice()));
			c.setTotalPrice(Double.parseDouble(p.getPrice()));

			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			
			HttpSession session=req.getSession();
			
			
			if(f)
			{
				session.setAttribute("addCart", "Pet Added To Your Cart");
				resp.sendRedirect("all_new_pet.jsp");
				//System.out.println("Added To Cart Succesfully");
			}
			else
			{
				session.setAttribute("failed", "Something Wrong On Server");
				resp.sendRedirect("all_new_pet.jsp");
				//System.out.println("Not Added To Cart");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
