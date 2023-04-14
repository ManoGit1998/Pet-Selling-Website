<%@page import="com.entity.PetDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.PetDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

</style>


</head>
<body>
<%
 User u=(User)session.getAttribute("userobj");
%>


<c:if test="${not empty addCart }">

<div id="toast"> ${ addCart} </div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

   <c:remove var="addCart" scope="session"/>

</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-5">


			<%
			PetDAOImpl dao = new PetDAOImpl(DBConnect.getConn());
			List<PetDetails> list1 = dao.getAllNewPets();
			for (PetDetails p : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="image/<%=p.getPhotoName()%>"
							style="width: 150x; height: 150px" class="img-thumblin">


						<p><%=p.getPetname()%></p>
						<p><%=p.getType()%></p>
						<p>
							Categories:
							<%=p.getPetcategory()%></p>

						<div class="row">
						
							
							<%
						   if(u==null)
						   {
							   %>
							   
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>
							   
							   
							   <%
						   }else
						   {
							   %>
							   
							<a href="cart?pid=<%= p.getPetid() %>&&uid=<%= u.getId() %>" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-arrow-down"></i>Add Cart</a>
							   
							   
							   <%
						   }
						%>
						
							
							<a href="view_pets.jsp?pid=<%=p.getPetid()%>"" class="btn btn-success btn-sm ml-1">Details</a>
							
							
							<a href="" class="btn btn-danger btn-sm mr-1"><%=p.getPrice()%><i
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