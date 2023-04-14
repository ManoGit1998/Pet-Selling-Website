<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting Page</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>

</head>
<body style="background-color: #f7f7f7">

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>



	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<c:if test="${not empty userobj }">
			<h3 class="text-center mt-3">Hello, ${userobj.name}</h3>
		</c:if>

		<div class="row p-5">
			<div class="col-md-4">
				<a href="sellpet.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<div class="text-primary">
								<i class="fa-solid fa-dog fa-3x"></i>
							</div>
							<h3>Sell Your Pet</h3>
						</div>
					</div>
				</a>
			</div>



			<div class="col-md-4">
				<a href="oldpet.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<div class="text-primary">
								<i class="fa-solid fa-dog fa-3x"></i>
							</div>
							<h3>Your Pet</h3>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-4">
				<a href="editprofile.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<div class="text-primary">
								<i class="fa-solid fa-user-pen fa-3x"></i>
							</div>
							<h4>Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<div class="text-danger">
								<i class="fa-solid fa-box fa-3x"></i>
							</div>
							<h3>My Orders</h3>
							<p>Track Your Orders</p>
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center ">
							<div class="text-primary">
								<i class="fa-solid fa-circle-user fa-3x"></i>
							</div>
							<h3>Help Center</h3>
							<p>24*7 Customer Service</p>
						</div>
					</div>
				</a>
			</div>



		</div>
	</div>

	<div class="mt-5">
		<%@include file="all_component/footer.jsp"%>

	</div>
</body>
</html>