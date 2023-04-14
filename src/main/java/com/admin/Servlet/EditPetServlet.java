package com.admin.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PetDAOImpl;
import com.DB.DBConnect;
import com.entity.PetDetails;

@WebServlet("/edit_pets")
public class EditPetServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String petname = req.getParameter("name");
			String type = req.getParameter("type");
			String price = req.getParameter("price");
			String status = req.getParameter("status");

			PetDetails s = new PetDetails();
			s.setPetid(id);
			s.setPetname(petname);
			s.setType(type);
			s.setPrice(price);
			s.setStatus(status);
			PetDAOImpl dao = new PetDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditPets(s);

			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg", "Pet Update Succesfully");
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
