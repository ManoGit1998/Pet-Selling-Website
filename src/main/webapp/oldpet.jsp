<%@page import="com.entity.PetDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.PetDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Pets</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>


	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center">
		${succMsg}
		</div>
	</c:if>

	<c:remove var="succMsg" scope="session" />

	<div class="container p-5">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Pet Name</th>
					<th scope="col">Type</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();
				PetDAOImpl dao = new PetDAOImpl(DBConnect.getConn());
				List<PetDetails> list = dao.getPetByOld(email, "Old");
				for (PetDetails p : list) {
				%>
				<tr>

					<td><%=p.getPetname()%></td>
					<td><%=p.getType()%></td>
					<td><%=p.getPrice()%></td>
					<td><%=p.getPetcategory()%></td>
					<td><a href="delete_pet?em=<%=email%>&&id=<%=p.getPetid() %>"
						class="btn btn-danger">Delete</a></td>
				</tr>

				<%
				}
				%>



			</tbody>
		</table>
	</div>
</body>
</html>