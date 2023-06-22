package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.helper.ConnectionProvider;

public class LoginServlet extends HttpServlet {

	protected void processRequest(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		res.setContentType("text/html");
		try(PrintWriter out= res.getWriter()){
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Login Servlet</title>");
			out.println("</head>");
			out.println("<body>"); 
			
			//fetch email and password from request
			String userEmail=req.getParameter("email");
			String userPassword=req.getParameter("password");
			
			UserDao dao =new UserDao(ConnectionProvider.getConnection());
			
			com.tech.blog.entities.User u= dao.getUserByEmailAndPassword(userEmail,userPassword);
			
			if(u==null) {
				//login error message
//				out.println("Invalid Details! Try Again...");
				Message msg=new Message("Username or password is wrong!","error","alert-danger");
				HttpSession s=req.getSession();
				s.setAttribute("msg", msg);
				res.sendRedirect("login_page.jsp");
			}else {
				HttpSession s=req.getSession();
				s.setAttribute("currentUser",u);
				res.sendRedirect("profile_page.jsp");
				out.println("I am still here");
			}
			out.println("</body>");
			out.println("</html>");
		}
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		processRequest(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		processRequest(req,res);
	}

}
