<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Selling Pets Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${empty userobj }">

		<c:redirect url="login.jsp" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h5 class="text-center text-primary p-1">Sell Your Pet</h5>
						<c:if test="${not empty succMsg}">
						<div class="text center text-success">
						${succMsg}
						</div>
						</c:if>
						<c:remove var="succMsg" scope="session" />


						<c:if test="${not empty failedMsg}">
							<div class="text center text-danger">
						${failedMsg}
						</div>
						</c:if>
						<c:remove var="failedMsg" scope="session" />

						<form action="seller_pet" method="post"
							enctype="multipart/form-data">



							<input type="hidden" value="${userobj.email }" name="user">


							<div class="form-group">
								<label for="exampleInputEmail1">Pet Name</label> <input
									name="name" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>



							<div class="form-group">
								<label for="exampleInputEmail1">Type</label> <input name="type"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" aria-describedby="emailHelp">
							</div>


							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>


							<button type="submit" class="btn btn-primary">Sell</button>

						</form>


					</div>

				</div>

			</div>
		</div>

	</div>

</body>
</html>