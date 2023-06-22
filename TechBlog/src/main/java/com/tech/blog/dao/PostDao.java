package com.tech.blog.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

	public ArrayList<Category> getAllCategory() {
		ArrayList<Category> list = new ArrayList<>();

		try {
			String q = "SELECT * FROM categories";
			Statement st = this.con.createStatement();
			ResultSet set = st.executeQuery(q);
			while (set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				Category c = new Category(cid, name, description);
				list.add(c);
			}

		} catch (Exception e) {
			e.getStackTrace();
		}

		return list;

	}

	public boolean savePost(Post p) {
		boolean f = false;

		try {
			String q = "INSERT INTO posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?);";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCatId());
			pstmt.setInt(6, p.getUserId());
			pstmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.getStackTrace();
		}

		return f;
	}

//	get all posts
	public List<Post> getAllPosts() {
		List<Post> list = new ArrayList<>();

		try {

			PreparedStatement p = con.prepareStatement("SELECT * FROM posts ORDER BY pid desc");
			ResultSet set = p.executeQuery();

			while (set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				list.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

//	get posts by category
	public List<Post> getPostByCatId(int catId) {
		List<Post> list = new ArrayList<>();

		try {

			PreparedStatement p = con.prepareStatement("SELECT * FROM posts WHERE catId=?;");
			p.setInt(1, catId);
			ResultSet set = p.executeQuery();

			while (set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
				list.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Post getPostByPostId(int postId) {
		String q="SELECT * FROM posts WHERE pid=? ";
		Post post=null;
		try {
			PreparedStatement p=this.con.prepareStatement(q);
			p.setInt(1,postId);
			
			ResultSet set=p.executeQuery();
			
			if(set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");
				post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post;
	}
}
