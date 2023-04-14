<%@page import="java.util.List"%>
<%@page import="com.entity.Pet_order"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.PetOrderDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="/login.jsp" />
	</c:if>
	<h3 class="text-center">Hello Admin</h3>

	<table class="table table-striped">
		<thead class="bg-primary  text-white">
			<tr>

				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Adress</th>
				<th scope="col">Ph NO</th>
				<th scope="col">Pet Name</th>
				<th scope="col">Type</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>

			<%
			PetOrderDAOImpl dao = new PetOrderDAOImpl(DBConnect.getConn());
			List<Pet_order> plist = dao.getAllPet();

			for (Pet_order p : plist) {
			%>

			<tr>
				<th scope="row"><%=p.getOrderId()%></th>
				<td><%=p.getUserName()%></td>
				<td><%=p.getEmail()%></td>
				<td><%=p.getFulladdress()%></td>
				<td><%=p.getPhno()%></td>
				<td><%=p.getPetName()%></td>
				<td><%=p.getType()%></td>
				<td><%=p.getPrice()%></td>
				<td><%=p.getPaymenttype()%></td>
			</tr>

			<%
			}
			%>


		</tbody>
	</table>

	</div>
	<div style="margin-top: 280px;">
		<%@include file="footer.jsp"%></div>
</body>
</html>