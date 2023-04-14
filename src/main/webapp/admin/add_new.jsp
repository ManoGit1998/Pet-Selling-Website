<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Pet</title>

<%@include file="allCss.jsp"%>

</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
     <c:redirect url="/login.jsp" />
     </c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">

					<div class="cardbody p-4">

						<h4 class="text-center">Add New</h4>

						<c:if test="${not empty succMsg}">
							<p class="tex-center text-success">${succMsg}</p>
						</c:if>
						<c:remove var="succMsg" scope="session" />
 

						<c:if test="${not empty failedMsg}">
							<p class="tex-center text-danger">${failedMsg}</p>
						</c:if>
						<c:remove var="failedMsg" scope="session" />


						<form action="../add_new" method="post"
							enctype="multipart/form-data">


							<div class="form-group">
								<label for="exampleInputEmail1">Pet Name*</label> <input
									name="name" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>



							<div class="form-group">
								<label for="exampleInputEmail1">Type Name*</label> <input
									name="type" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" aria-describedby="emailHelp">
							</div>



							<div class="form-group">
								<label for="inputState">Category</label> <select id="inputState"
									name="pettype" class="form-control">

									<option selected>---Select---</option>
									<option value="New">---New---</option>

								</select>
							</div>


							<div class="form-group">
								<label for="inputState">Status</label> <select id="inputState"
									name="status" class="form-control">

									<option selected>---Select---</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>

								</select>
							</div>



							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>


							<button type="submit" class="btn btn-primary">Add</button>

						</form>


					</div>
				</div>

			</div>

		</div>
	</div>

</body>
</html>
