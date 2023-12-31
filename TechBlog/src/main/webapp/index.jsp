<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<!-- css -->
<link rel="stylesheet" href="./webapp/css/mystyle.css" type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 67% 93%, 33% 100%, 0 92%, 0 0
		);
}

.primary-background {
	background: #2196f3 !important;
}
</style>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v16.0" nonce="U4JNOV8p"></script>

</head>
<body>
	<!-- Navbar  -->
	<%@include file="normal_navbar.jsp"%>

	<!-- Banner -->

	<div class="container-fluid m-0 p-0 ">
		<div class="jumbotron primary-background text-white banner-background">
			<div class="container">
				<h3 class="display-3">Welcome to Tech Blog</h3>
				<p>A programming language is a system of notation for writing
					computer programs. Most programming languages are text-based formal
					languages, but they may also be graphical. They are a kind of
					computer language.</p>
				<p>The description of a programming language is usually split
					into the two components of syntax and semantics, which are usually
					defined by a formal language.</p>
				<button class="btn btn-outline-light btn-lg">
					<span class="fa fa-external-link"></span> Start! it's free
				</button>
				<a href="error_page.jsp" class="btn btn-outline-light btn-lg"> <span
					class="fa fa-user-circle fa-spin"></span> Login
				</a>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more...</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more...</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more...</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more...</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more...</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">

					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more...</a>
					</div>
				</div>
			</div>
		</div>

	</div>


	<!-- javascript -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			/* alert("ola!") */
		})
	</script>
	<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>














