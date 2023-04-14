<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.PetDAOImpl"%>
<%@page import="com.entity.PetDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Pet</title>

<%@include file="allCss.jsp"%>

</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">

					<div class="cardbody p-4">

						<h4 class="text-center">EDIT BY ADMIN</h4>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						PetDAOImpl dao = new PetDAOImpl(DBConnect.getConn());
						PetDetails p = dao.getPetById(id);
						%>


						<form action="../edit_pets" method="post">
							<input type="hidden" name="id" value="<%=p.getPetid()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Pet Name*</label> <input
									name="name" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=p.getPetname()%>">
							</div>



							<div class="form-group">
								<label for="exampleInputEmail1">Type Name*</label> <input
									name="type" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=p.getType()%>">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" aria-describedby="emailHelp"
									value="<%=p.getPrice()%>">
							</div>



							<div class="form-group">
								<label for="inputState">Status</label> <select id="inputState"
									name="status" class="form-control">

									<%if ("Active".equals(p.getStatus())) {%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%} else {%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%}%>



								</select>
							</div>

                       



							<button type="submit" class="btn btn-primary">Update</button>

						</form>


					</div>
				</div>

			</div>

		</div>
	</div>

</body>
</html>
