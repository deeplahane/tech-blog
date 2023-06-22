package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;

public class LikeServlet extends HttpServlet {
	
	protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html");
		try (PrintWriter out = res.getWriter()) {
			String operation=req.getParameter("operation");
			int pid=Integer.parseInt(req.getParameter("pid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
			if(operation.equals("like")) {
				boolean f=ld.insertLike(pid, uid);
				out.println(f);
			}
		}
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		processRequest(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		processRequest(req,res);
	}

}
