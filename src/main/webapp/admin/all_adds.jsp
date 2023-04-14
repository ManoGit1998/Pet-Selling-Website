<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.PetDAOImpl"%>
<%@page import="java.util.ArrayList.*"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.PetDetails"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:All Adds</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
     <c:redirect url="/login.jsp" />
     </c:if>
	
	<h3 class="text-center">Hello Admin</h3>
	
	
						<c:if test="${not empty succMsg}">
							<h5 class="tex-center text-success">${succMsg}</h5>
						</c:if>
						<c:remove var="succMsg" scope="session" />


						<c:if test="${not empty failedMsg}">
							<h5 class="tex-center text-danger">${failedMsg}</h5>
						</c:if>
						<c:remove var="failedMsg" scope="session" />

	<table class="table table-striped">
		<thead class="bg-primary  text-white">
			<tr>
                <th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Pet Name</th>
				<th scope="col">Type</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			PetDAOImpl dao = new PetDAOImpl(DBConnect.getConn());
			List<PetDetails> list = dao.getAllPets();

			for (PetDetails p : list) {
			%>
			<tr>
				<td><%=p.getPetid() %></td>
				<td><img src="../image/<%=p.getPhotoName() %>" style="width :50px;height: 50px;"></td>
				<td><%=p.getPetname() %></td>
				<td><%=p.getType() %></td>
				<td><%=p.getPrice() %></td>
				<td><%=p.getPetcategory() %></td>
				<td><%=p.getStatus() %></td>

				<td><a href="edit_pets.jsp?id=<%=p.getPetid()%>" class="btn btn-sm btn-primary"><i class="fa-solid fa-calendar-pen"></i>Edit</a> <a
					href="../delete?id=<%=p.getPetid()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-xmark"></i> Delete</a></td>
			</tr>

			<%
			}
			%>


		</tbody>
	</table>

	</div>
	</div>
	<div style="margin-top: 280px;">
		<%@include file="footer.jsp"%></div>
</body>
</html>