<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry! Something went wrong...</title>
<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
</head>
<body>
	<div class="container text-center">
		<img src="/img/error.png" class="img-fluid"
			style="max-height: 400px; max-widht: 400px" />
		<h3 class="display-5">Sorry! Something went wrong...</h3>
		<%= exception %>
		<br /> <a href="index.jsp"
			class="btn btn-lg primary-background mt-3 pt-1 pb-1 text-white">Home</a>
	</div>
</body>
</html>