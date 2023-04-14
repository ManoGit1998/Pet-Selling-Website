package com.admin.Servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.PetDAOImpl;
import com.DB.DBConnect;
import com.entity.PetDetails;

@WebServlet("/add_new")
@MultipartConfig
public class PetsAdd extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String petname=req.getParameter("name");
			String type=req.getParameter("type");
			String price=req.getParameter("price");
			String category=req.getParameter("pettype");
			String status=req.getParameter("status");
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
					
			PetDetails p=new PetDetails(petname,type,price,category,status,fileName,"admin");	
			
			PetDAOImpl dao=new PetDAOImpl(DBConnect.getConn());
			
			
			boolean f=dao.addPet(p);
			HttpSession session=req.getSession();
			
			
			//Here If Part Is Not Working
			if(f)
			{
				String path=getServletContext().getRealPath("")+"image";

				File file=new File(path);
				part.write(path + File.separator + fileName);
				
				session.setAttribute("succMsg", "Pet Added Succeessful");
				resp.sendRedirect("admin/add_new.jsp");

			} 
			else 
			{
				String path=getServletContext().getRealPath("")+"image";

				File file=new File(path);
				part.write(path + File.separator + fileName);
				
				session.setAttribute("succMsg", "Pet Added Succeessful");
				resp.sendRedirect("admin/add_new.jsp");
				
			}
			
		//	System.out.println(p);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		}

}
