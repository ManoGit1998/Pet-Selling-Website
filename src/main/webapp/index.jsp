
<%@page import="com.entity.User"%>
<%@page import="com.entity.PetDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.PetDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GetPet Index Page</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("image/banner.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>

</head>
<body style="background-color: #f7f7f7"
	<%User u = (User) session.getAttribute("userobj");%>
	style="background-color: #f7f7f7 " style="background-color: #f7f7f7 ">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-white">Better Pets For Your Home</h2>
	</div>



	<!-- Start Recent Pet -->

	<div class="container">
		<h3 class="text-center">Recent Pets</h3>
		<div class="row">

			<%
			PetDAOImpl dao2 = new PetDAOImpl(DBConnect.getConn());
			List<PetDetails> list = dao2.getRecentPet();
			for (PetDetails p : list) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="image/<%=p.getPhotoName()%>"
							style="width: 150x; height: 220px" class="img-thumblin">
						<p><%=p.getPetname()%></p>
						<p><%=p.getType()%></p>
						<p>
							Categories:
							<%=p.getPetcategory()%></p>

						<%
						if (p.getPetcategory().equals("Old")) {
						%>
						<div class="row">

							<a href="view_pets.jsp?pid=<%=p.getPetid()%>"
								class="btn btn-success btn-sm">View Details</a> <a
								href="view_pets.jsp" class="btn btn-danger btn-sm"><%=p.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
						<%
						} else {
						%>


						<div class="row">

							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>


							<%
							} else {
							%>

							<a href="cart?pid=<%=p.getPetid()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>


							<%
							}
							%>


							<a href="view_pets.jsp?pid=<%=p.getPetid()%>"
								class="btn btn-success btn-sm">View Details</a> <a href=""
								class="btn btn-danger btn-sm"><%=p.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
						<%
						}
						%>



					</div>

				</div>
			</div>
			<%
			}
			%>



		</div>

		<div class="text-center text-color:white mt-1">
			<a href="all_recent_pet.jsp" class="btn btn-danger btn-sm">View
				All</a>
		</div>
	</div>

	<!-- End Recent Pet -->

	<hr>


	<!-- Start New Pet -->
	<div class="container">
		<h3 class="text-center">New Pets</h3>

		<div class="row">


			<%
			PetDAOImpl dao = new PetDAOImpl(DBConnect.getConn());
			List<PetDetails> list1 = dao.getNewPet();
			for (PetDetails p : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="image/<%=p.getPhotoName()%>"
							style="width: 150x; height: 200px" class="img-thumblin">


						<p><%=p.getPetname()%></p>
						<p><%=p.getType()%></p>
						<p>
							Categories:
							<%=p.getPetcategory()%></p>

						<div class="row">
							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>


							<%
							} else {
							%>

							<a href="cart?pid=<%=p.getPetid()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>


							<%
							}
							%>


							<a href="view_pets.jsp?pid=<%=p.getPetid()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=p.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

					</div>
				</div>
			</div>

			<%
			}
			%>


		</div>

		<div class="text-center text-color:white mt-2">
			<a href="all_new_pet.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>
	</div>

	<!-- End New Pet -->


	<hr>
	<!-- Start Seller Pet -->
	<div class="container">
		<h3 class="text-center">Sellers Pet</h3>

		<div class="row">

			<%
			PetDAOImpl dao3 = new PetDAOImpl(DBConnect.getConn());
			List<PetDetails> list3 = dao3.getOldPet();
			for (PetDetails p : list3) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="image/<%=p.getPhotoName()%>"
							style="width: 150x; height: 200px" class="img-thumblin">
						<p><%=p.getPetname()%></p>
						<p><%=p.getType()%></p>
						<p>
							Category:<%=p.getPetcategory()%></p>

						<div class="row">

							<a href="view_pets.jsp?pid=<%=p.getPetid()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=p.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>

		<div class="text-center text-color:white mt-2">
			<a href="all_old_pet.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>
	</div>

	<!-- End Seller Pet -->

	<%@include file="all_component/footer.jsp"%>
</body>
</html>