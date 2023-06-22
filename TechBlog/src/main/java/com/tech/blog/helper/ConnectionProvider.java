package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			
		if(con==null) {
			//laod driver class
			Class.forName("com.mysql.jdbc.Driver");
			
			//crete a connection
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog?autoReconnect=true&useSSL=false","root","Deeplahane2001#1");
			
		}
			
		}catch(Exception e) {
			e.getStackTrace();
		}
		
		
		return con;
	}
}
