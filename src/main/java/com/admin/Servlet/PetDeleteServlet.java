package com.admin.Servlet;

import java.awt.print.Book;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PetDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete")
public class PetDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			PetDAOImpl dao=new PetDAOImpl(DBConnect.getConn());
			boolean f=dao.deletePets(id);
			
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg", "Book Deleted Succesfully");
				resp.sendRedirect("admin/all_adds.jsp");
			} else {

				session.setAttribute("failedMsg", "Something Went Wrong");
				resp.sendRedirect("admin/all_adds.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

