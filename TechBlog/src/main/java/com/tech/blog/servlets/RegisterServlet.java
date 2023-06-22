package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig

public class RegisterServlet extends HttpServlet {

	protected void processRequest(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException {
		res.setContentType("text/html");
		try(PrintWriter out = res.getWriter()){
    		
			String check = req.getParameter("check");
			 
			if(check==null) {
				out.println("Box not checked");
			}else {
				
				String name = req.getParameter("user_name");
				String email = req.getParameter("user_email");
				String password= req.getParameter("user_password");
				String gender = req.getParameter("gender");
				String about = req.getParameter("about");
				
				User user=new User(name,email,password,gender,about);
				
				UserDao doa = new UserDao(ConnectionProvider.getConnection());
				if(doa.SaveUser(user)) {
					out.println("done");
				}else {
					out.println("error occured");
				}
			}
		}
	}
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		processRequest(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		processRequest(req, res);
	}

}
