package com.tech.blog.dao;

import java.sql.*;

import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	//method to insert user in database
	
	public boolean SaveUser(User user) {
		boolean b=false;
		try {
			
			//user->database
			String query="INSERT INTO user(name,email,password,gender,about) VALUES(?,?,?,?,?);";
			PreparedStatement pstmt= this.con.prepareStatement(query);
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3,user.getPassword());
			pstmt.setString(4,user.getGender());
			pstmt.setString(5,user.getAbout());
			
			pstmt.executeUpdate();
			b=true;
			
		}catch(Exception e) {
			e.getStackTrace();
		}
		return b;
	}
	
	//get user by user_name and user_email
	public User getUserByEmailAndPassword(String email,String password) {
		User user=null;
		
		try {
			String query="SELECT * FROM user WHERE email=? AND password=? ";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1,email);
			pstmt.setString(2,password);
			
			ResultSet set=pstmt.executeQuery();
			
			if(set.next()) {
				user=new User();
				String name=set.getString("name");
				user.setName(name);
				
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
				
			}
			
		}catch(Exception e) {
			e.getStackTrace();
		}
		
		return user;
	}
	
	public boolean updateUser(User user) {
		boolean f=false;
		try {
			String query="UPDATE user set name=?, email=?, password=?, about=?, profile=? WHERE id=?";
			PreparedStatement p=con.prepareStatement(query);
			p.setString(1, user.getName());
			p.setString(2, user.getEmail());
			p.setString(3, user.getPassword());
			p.setString(4, user.getAbout());
			p.setString(5, user.getProfile());
			p.setInt(6, user.getId());
			
			p.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.getStackTrace();
		}
		return f;
	}
	
	public User getUserByUserId(int userId) {
		User user=null;
		
		try {
			String q="SELECT * FROM user WHERE id=?";
			PreparedStatement pst=this.con.prepareStatement(q);
			pst.setInt(1, userId);
			ResultSet set=pst.executeQuery();
			
			if(set.next()) {
				user=new User();
				String name=set.getString("name");
				user.setName(name);
				
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
}
















