<%@page import="com.entity.PetDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.PetDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Pet</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>


</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-5">
		
			
			<%
			PetDAOImpl dao3 = new PetDAOImpl(DBConnect.getConn());
			List<PetDetails> list3 = dao3.getAllOldPets();
			for (PetDetails p : list3) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="image/<%=p.getPhotoName()%>"
							style="width: 100x; height: 150px" class="img-thumblin">
						<p><%=p.getPetname()%></p>
						<p><%=p.getType()%></p>
						<p>Category:<%=p.getPetcategory()%></p>

						<div class="row">
							
								<a href="view_pets.jsp?pid=<%=p.getPetid()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> 
								<a href=""
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

		</div>
	</div>
</body>
</html>