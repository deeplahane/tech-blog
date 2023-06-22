package com.tech.blog.dao;
import java.sql.*;

public class LikeDao {
	Connection con;
	
	public LikeDao(Connection con) {
		this.con=con;
	}
	
	public boolean insertLike(int pid,int uid) {
		boolean f=false;
		try {
			String q="Insert INTO liked(pid,uid) VALUES(?,?)";
			PreparedStatement p=this.con.prepareStatement(q);
			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public int countLikeOnPost(int pid) {
		int count=0;
		
		try {
			String q="SELECT COUNT(*) FROM liked WHERE pid=?";
			PreparedStatement p=this.con.prepareStatement(q);
			p.setInt(1, pid);
			ResultSet set=p.executeQuery();
			if(set.next()) {
				count=set.getInt("COUNT(*)");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public boolean isLikedByUser(int pid,int uid) {
		boolean f=false;
		
		try {
			PreparedStatement p=this.con.prepareStatement("SELECT * FROM liked WHERE pid=? AND uid=?");
			p.setInt(1, pid);
			p.setInt(2, uid);
			ResultSet set=p.executeQuery();
			if(set.next()) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean deleteLike(int pid,int uid) {
		boolean f=false;
		
		try {
			PreparedStatement p=this.con.prepareStatement("DELETE FROM liked WHERE pid=? AND uid=?");
			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f=true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

}
