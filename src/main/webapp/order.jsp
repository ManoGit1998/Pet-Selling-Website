<%@page import="com.entity.Pet_order"%>
<%@page import="java.util.List"%>
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
<title>Order Details</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-1">
		<h3 class="text-center text-primary">Your Order</h3>

		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Pet Name</th>
					<th scope="col">Type</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				PetOrderDAOImpl dao = new PetOrderDAOImpl(DBConnect.getConn());
				List<Pet_order> plist = dao.getPet(u.getEmail());
				for (Pet_order p : plist) {
				%>

				<tr>
					<th scope="row"><%=p.getOrderId()%></th>
					<td><%=p.getUserName()%></td>
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

</body>
</html>