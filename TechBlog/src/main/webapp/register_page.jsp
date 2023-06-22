<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up page</title>
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
</head>
<body>
	<%@include file="normal_navbar.jsp"%>

	<main class="banner-background primary-background"
		style="height: 120vh">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-3">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-circle fa-3x"></span> <br /> Sign up
							here
						</div>
						<div class="card-body">
							<form id="reg-form" action="RegisterServlet" method="POST">

								<div class="form-group">
									<label for="exampleInputEmail1">User Name</label> <input
										name="user_name" type="text" class="form-control"
										id="user_name" aria-describedby="emailHelp"
										placeholder="Enter User Name">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="user_email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email"> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="user_password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>

								<div class="form-group">
									<label for="gender" style="padding-right: 30px">Select
										Gender</label> <input style="padding-right: 20px" name="gender"
										type="radio" id="gender" value="male" />Male <input
										name="gender" type="radio" id="gender" value="female" />Female
								</div>

								<div class="form-group">
									<textarea id="" class="form-control" name="about"
										placeholder="Enter something about yourself" rows="3"></textarea>
								</div>

								<div class="form-check">
									<input name="check" type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">agree terms and conditions</label>
								</div>
								<br />

								<div class="container text-center" id="loader"
									style="display: none">
									<span class="fa-fa-refresh fa-spin fa-4x"></span>
									<p>Please wait...</p>
								</div>

								<button id="submit-btn" type="submit" class="btn btn-primary">Sign
									Up</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>


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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
		$(document).ready(function() {
			console.log("loaded...")
			
			$('#reg-form').on('submit',function(event){
				event.preventDefault();
				
				let form=new FormData(this);
				
				
				$('#submit-btn').hide();
				$('#loader').show();
				$.ajax({
					url:"RegisterServlet",
					type:'POST',
					data:form,
					success:function(data,textStatus,jqXHR){
						console.log(data)
						$('#submit-btn').show();
						$('#loader').hide();
						
						if(data.trim()==='done'){
							swal("Registered Successfully... You will be redirected to login page.")
							.then((value) => {
							  window.location="login_page.jsp"
							});
						}else{
							swal(data);
						}
					},
					error:function(jqXHR,textStatus,errorThrown){
						$('#submit-btn').show();
						$('#loader').hide();
						swal("Something went wrong... Try again.")
					},
					processData:false,
					contentType:false
				});
				
			});
		})
	</script>
	<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>