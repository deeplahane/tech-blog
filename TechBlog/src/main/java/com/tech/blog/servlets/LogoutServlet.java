package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Message;

public class LogoutServlet extends HttpServlet {

	protected void processRequest(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		res.setContentType("text/html");
		try (PrintWriter out = res.getWriter()) {
			
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Logout Servlet</title>");
			out.println("<head>");
			out.println("<body>");
			
			HttpSession s =req.getSession();
			s.removeAttribute("currentUser");
			
			Message msg= new Message("Logout Successfull!","success","alert-success");
			
			s.setAttribute("msg", msg);
			res.sendRedirect("login_page.jsp");
			
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
