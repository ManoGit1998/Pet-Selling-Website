<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Home</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="navbar.jsp"%>

     <c:if test="${empty userobj }">
     <c:redirect url="/login.jsp" />
     </c:if>


	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">

				<a href="add_new.jsp">
					<div class="card">
						<div class="card-body text-center">

							<i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
							<h4>Add New</h4>
							--------


						</div>
					</div>
				</a>
			</div>



			<div class="col-md-3">

				<a href="all_adds.jsp">
					<div class="card">
						<div class="card-body text-center">

							<i class="fa-solid fa-dog fa-3x text-danger"></i><br>
							<h4>All Adds</h4>
							--------
						</div>
					</div>
				</a>
			</div>




			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">

							<i class="fa-solid fa-cart-flatbed-suitcase fa-3x text-warning"></i><br>
							<h4>Orders</h4>
							--------
						</div>
					</div>
				</a>
			</div>



			<div class="col-md-3">

				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body text-center">

							<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
							<h4>Logout</h4>
							--------

						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do You Want To Logout</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="../logout" type="button"
							class="btn btn-primary text-white">Logout</a>


					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<div style="margin-top: 280px;">
		<%@include file="footer.jsp"%></div>
</body>
</html>