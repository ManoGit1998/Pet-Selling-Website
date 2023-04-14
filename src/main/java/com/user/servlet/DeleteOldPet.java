package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PetDAOImpl;
import com.DB.DBConnect;
@WebServlet("/delete_pet")
public class DeleteOldPet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String em=req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			PetDAOImpl dao=new PetDAOImpl(DBConnect.getConn());
			boolean f=dao.oldPetDelete(em, "old",id);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Old Pet Delete Succesfully");
				resp.sendRedirect("oldpet.jsp");
			}else {
				
				session.setAttribute("succMsg", "Something Wrong On Server");
				resp.sendRedirect("oldpet.jsp");
			}
			
			
		
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
