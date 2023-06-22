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

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
 

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	
	protected void proccessRequest(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html");
		try(PrintWriter out =res.getWriter()){
//			out.println("<html>");
//			out.println("<head>");
//			out.println("<title>Add Post Servlet</title>");
//			out.println("<head>");
//			out.println("<body>");
//			out.println("</body>");
			
			int cid=Integer.parseInt(req.getParameter("cid"));
			String pTitle=req.getParameter("pTitle");
			String pContent=req.getParameter("pContent");
			String pCode=req.getParameter("pCode");
			Part part=req.getPart("pic");
			
			//Getting current userId
			HttpSession session=req.getSession();
			User user=(User) session.getAttribute("currentUser");
			
//			out.println(pTitle);
//			out.println(part.getSubmittedFileName());
			
			Post p=new Post(pTitle,pContent,pCode,part.getSubmittedFileName(),null,cid,user.getId());
			PostDao dao=new PostDao(ConnectionProvider.getConnection());
			if(dao.savePost(p)) {
				@SuppressWarnings("deprecation")
				String path = req.getRealPath("/") + "blog_pics" + File.separator + part.getSubmittedFileName();
				Helper.saveFile(part.getInputStream(), path);
				out.println("done");
//				out.println("done");
			}else {
				out.println("error");
			}
	
//			out.println("</html>");
		}
	}
	
   	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		proccessRequest(req,res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		proccessRequest(req,res);
	}

}
