<%@page import="com.entity.PetDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.PetDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>

	<%
	int pid = Integer.parseInt(request.getParameter("pid"));

	PetDAOImpl dao = new PetDAOImpl(DBConnect.getConn());
	PetDetails p = dao.getPetById(pid);
	%>
	<div class="container p-3">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="image/<%=p.getPhotoName()%>"
					style="height: 150px; width: 150px;"><br>
				<h4 class="mt-3">
					Name :<span class="text-success"><%=p.getPetname()%></span>
				</h4>
				<h4>
					Type : <span class="text-success"><%=p.getType()%></span>
				</h4>
				<h4>
					Category :<span class="text-success"><%=p.getPetcategory()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=p.getPetname()%></h2>

				<%
				if ("Old".equals(p.getPetcategory())) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> Email:
					<%=p.getEmail()%></h5>
				<%
				}
				%>


				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck-moving fa-2x"></i>
						<p>Free Shiping</p>
					</div>

					<%
					if ("Old".equals(p.getPetcategory())) {
					%>

					<div class="text-center p-3">
						<a href="index.jsp" class="btn btn-success ml-5">Continue Shopping <i
							class="fa-solid fa-cart-plus"></i></a> <a href=""
							class="btn btn-danger"><%=p.getPrice() %> <i
							class="fa-solid fa-indian-rupee-sign"></i></a>

					</div>

					<%
					} else {
					%>

					<div class="text-center p-3">
						<a href="" class="btn btn-primary ml-5 ">Add To Cart <i
							class="fa-solid fa-cart-plus"></i></a> <a href=""
							class="btn btn-danger ml-3" ><%= p.getPrice() %><i
							class="fa-solid fa-indian-rupee-sign"></i></a>

					</div>


					<%
					}
					%>

				</div>


			</div>
		</div>

	</div>

</body>
</html>