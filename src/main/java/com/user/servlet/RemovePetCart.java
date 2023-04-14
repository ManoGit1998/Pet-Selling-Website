package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
@WebServlet("/remove_pet")
public class RemovePetCart extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		int pid=Integer.parseInt(req.getParameter("pid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		
		CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
		boolean f=dao.deletePet(pid,uid,cid);
		HttpSession session=req.getSession();
		
		if(f)
		{
			session.setAttribute("succMsg", "Pet Removed From Cart");
			resp.sendRedirect("cart.jsp");
		}else {
			
			session.setAttribute("failedMsg", "Something Wrong On Server");
			resp.sendRedirect("cart.jsp");
		}
		
		
	}
	
	

}
