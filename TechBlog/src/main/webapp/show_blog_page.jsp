<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>

<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao d = new PostDao(ConnectionProvider.getConnection());
Post p = d.getPostByPostId(postId);
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle()%> || Tech Blog</title>
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

.post-title {
	font-weight: 100;
	font-size: 30px;
}

.post-content {
	font-weight: 100;
	font-size: 20px;
}

.post-date {
	font-style: italic;
}

.row-user {
	border-bottom: 2px solid #e2e2e2;
	/* box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px; */
}

.primary-background {
	background: #2196f3 !important;
}

body {
	background-size: cover;
	background-attachment: fixed;
	background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);
}
</style>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v16.0" nonce="U4JNOV8p"></script>

</head>
<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"> <span
			class="fa fa-asterisk"></span> Tech Blog
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile_page.jsp"> <span class="fa fa-bell-o"></span>
						LearnCode With Deep<span class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><span class="fa fa-check-square-o"></span>
						Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structures</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="	fa fa-address-book-o"></span> Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="	fa fa-pencil"></span> Do Post</a></li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user-circle"></span> <%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa fa-sign-out"></span> Logout</a></li>
			</ul>

		</div>
	</nav>
	<!-- end of navbar -->

	<!-- Main body  -->

	<div class="container">
		<div class="row my-4">
			<div class="col-md-10 offset-md-1">
				<div class="card">
					<div class="card-header primary-background text-white">
						<h3 class="post-title"><%=p.getpTitle()%></h3>
					</div>
					<div class="card-body">
						<img class="card-img-top my-2 " src="blog_pics/<%=p.getpPic()%>"
							alt="Card image cap">
						<div class="row my-2 row-user">
							<div class="col-md-8">
								<h4 class='post-user-info'>
									<a href="#!"> <%
 UserDao ud = new UserDao(ConnectionProvider.getConnection());
 %>
										<%=ud.getUserByUserId(p.getUserId()).getName()%></a> posted on:
								</h4>
							</div>
							<div class="col-md-4">
								<h5 class="text-right post-date"><%=DateFormat.getDateInstance().format(p.getpDate())%></h5>
							</div>
						</div>

						<p class="post-content"><%=p.getpContent()%></p>
						<br> <br>
						<div class="post-code">
							<pre><%=p.getpCode()%></pre>
						</div>
					</div>
					<div class="card-footer primary-background">
					<%
				LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
			%>
						<a href="#!" onclick="doLike(<%= p.getPid() %>,<%= user.getId() %> )" class="btn btn-outline-light btn-sm"><i
							class="fa fa-thumbs-o-up"><span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></i></a> <a href="#!"
							class="btn btn-outline-light btn-sm"><i
							class="fa fa-commenting-o"><span>20</span></i></a>

					</div>
					<div class="card-footer">
						<div class="fb-comments" data-href="http://localhost:8080/TechBlog/show_blog_page.jsp?post_id=<%= p.getPid() %>" data-width="" data-numposts="5"></div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- End of Main body  -->


	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title " id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img class="img" alt="img"
							style="max-width: 120px; max-height: 100px; border-radius: 50%"
							src="http://localhost:8084/TechBlog/pics/<%=user.getProfile()%>" />
						<h5 class="modal-title mt-3" style="margin-bottom: 20px"
							id="exampleModalLabel"><%=user.getName()%></h5>

						<!-- remaining details -->

						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">Id:</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">E-mail:</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>
									</tr>

									<tr>
										<th scope="row">Status:</th>
										<td><%=user.getAbout()%></td>
									</tr>

									<tr>
										<th scope="row">Registered On:</th>
										<td><%=user.getDateTime()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- Profile edit -->

						<div id="profile-edit" style="display: none;">
							<h3>Please edit carefully!</h3>
							<form action="EditServlet" method="POST"
								enctype='multipart/form-data'>
								<table class="table">
									<tr>
										<td>Id:</td>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<td>Name:</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>" /></td>
									</tr>
									<tr>
										<td>E-mail:</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>" /></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>" /></td>
									</tr>
									<tr>
										<td>Gender:</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About:</td>
										<td><textarea rows="3" type="text" class="form-control"
												name="user_about">
											<%=user.getAbout()%>
											</textarea></td>
									</tr>

									<tr>
										<td>Change Profile Pic:</td>
										<td><input type="file" name="image" class="form-control">
										</td>
									</tr>

								</table>
								<button type="submit" class="btn btn-outline-success">Save
									Changes</button>
							</form>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<div id="edit-btn">
							<button type="button" id="edit-profile-btn"
								class="btn btn-primary">Edit</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- do post modal -->
	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details...</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="POST">

						<div class="form-group">

							<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>
								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategory();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>

						</div>

						<div class="form-group">
							<input type="text" name="pTitle" class="form-control"
								placeholder="Enter Post title" />
						</div>

						<div class="form-group">
							<textarea rows="5" name="pContent" class="form-control"
								placeholder="Enter Post Content"></textarea>
						</div>

						<div class="form-group">
							<textarea rows="5" name="pCode" class="form-control"
								placeholder="Enter program (optional)"></textarea>
						</div>

						<div class="form-group">
							<label>Select your pic...</label> <input type="file" name="pic"
								class="form-control" />
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>
						</div>

					</form>

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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			let editStatus = false

			$('#edit-profile-btn').click(function() {

				if (editStatus == false) {
					$("#profile-details").hide()
					$("#profile-edit").show()
					$(this).text("Back")
					editStatus = true
				} else {
					$("#profile-details").show()
					$("#profile-edit").hide()
					$(this).text("Edit")
					editStatus = false
				}
			})
		});
	</script>
	<script>
		$(document)
				.ready(
						function() {
							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												//this function gets called when form is submitted...
												event.preventDefault();
												console
														.log("you have clicked on submit...")
												let form = new FormData(this);

												//now requsting to server
												$
														.ajax({
															url : "AddPostServlet",
															type : "POST",
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																console
																		.log(data);
																if (data.trim() == 'done') {
																	console
																			.log("post added successfully");
																	swal(
																			"Good job!",
																			"Post created successfully!",
																			"success");
																} else {
																	console
																			.log("error occured");
																	swal(
																			"Error!",
																			"Something went wrong...",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																console
																		.log("error occure1");
																swal(
																		"Error!",
																		"Something went wrong...",
																		"error");
															},
															processData : false,
															contentType : false
														});
											})
						});
	</script>
</body>
</html>