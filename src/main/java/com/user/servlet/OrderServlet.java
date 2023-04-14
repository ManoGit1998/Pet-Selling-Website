package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.PetOrderDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Pet_order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("useremail");
			String phno = req.getParameter("userphone");
			String address = req.getParameter("useraddress");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymenttype = req.getParameter("paymenttype");

			String fulladdress = address + "," + landmark + "," + city + "," + state + "," + pincode;

			// System.out.println(name+","+email+","+phno+","+fulladdress+","+paymenttype);

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			List<Cart> plist = dao.getPetByUser(id);

			if(plist.isEmpty())
			{
				session.setAttribute("failedMsg","Please Add  Pets");
				resp.sendRedirect("cart.jsp");
			}
			else {
				

				PetOrderDAOImpl dao2 = new PetOrderDAOImpl(DBConnect.getConn());
				
				Pet_order o = null;

				ArrayList<Pet_order> orderlist = new ArrayList<Pet_order>();
	            Random r=new Random();
				for (Cart c : plist) {
					// System.out.println(c.getPetname()+""+c.getType()+""+c.getPrice());
					 o = new Pet_order();
					o.setOrderId("PET-ORD-00" + r.nextInt(1000));
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladdress(fulladdress);
					o.setPetName(c.getPetname());
					o.setType(c.getType());
					o.setPrice(c.getPrice() + "");
					o.setPaymenttype(paymenttype);
					orderlist.add(o);

				}

				if ("noselect".equals(paymenttype)) {
					 session.setAttribute("failedMsg","Select Payment Method");
					resp.sendRedirect("cart.jsp");

				} else {

					boolean f = dao2.saveOrder(orderlist);
					if (f) {

	                        
	                         resp.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("failedMsg","Order Failed");
	                    resp.sendRedirect("cart.jsp");
					}
				}
			}
		}catch (Exception e)
		{
			e.printStackTrace();
		}


	}

}
