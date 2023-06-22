package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
public class EditServlet extends HttpServlet {

	protected void processRequest(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html");
		try (PrintWriter out = res.getWriter()) {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Edit Servlet</title>");
			out.println("</head>");
			out.println("<body>");

//			fetch all values from profile page
			String userName = req.getParameter("user_name");
			String userEmail = req.getParameter("user_email");
			String userPassword = req.getParameter("user_password");
			String userAbout = req.getParameter("user_about");
			Part part = req.getPart("image");
			String imageName = part.getSubmittedFileName();

			// getting the user from the session
			HttpSession s = req.getSession();
			User user = (User) s.getAttribute("currentUser");
			user.setName(userName);
			user.setEmail(userEmail);
			user.setPassword(userPassword);
			user.setProfile(imageName);
			user.setAbout(userAbout);
			String oldPath=user.getProfile();
			user.setProfile(imageName);

			// update database
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			boolean ans = userDao.updateUser(user);
			if (ans) {
				out.println("updated");

				String path = req.getRealPath("/") + "pics" + File.separator + user.getProfile();
				String oldPathFile = req.getRealPath("/") + "pics" + File.separator + oldPath;

				if(!oldPath.equals("default.png")) {
					Helper.deleteFile(oldPathFile);
				}
				
				if (Helper.saveFile(part.getInputStream(), path)) {
					out.println("profile updated...");
					Message msg=new Message("profile details updated...","success","alert-success");
					s.setAttribute("msg", msg);
				} else {
					out.println("Something went wrong!");
					Message msg=new Message("Something went wrong!","error","alert-danger");
					s.setAttribute("msg", msg);
				}

			} else {
				out.println("not updated");
			}
			
			res.sendRedirect("profile_page.jsp");

			out.println("</body>");
			out.println("</html>");

		}

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		processRequest(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		processRequest(req, res);
	}
}
