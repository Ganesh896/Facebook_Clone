
package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Dell
 */
public class LikeDao {
    Connection con;
    
    public LikeDao(Connection con) {
        this.con = con;
    }
    
    public boolean insertLike(int pid, int uid) {
        boolean flag = false;
        
        try {
            String query = "insert into likes(pid, uid, cssClass) values(?, ?, ?)";
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setInt(1, pid);
            psmt.setInt(2, uid);
            psmt.setString(3, "postLike");
            psmt.executeUpdate();
            
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }
    
    public int countLikes(int pid) {
        int count = 0;
        
        try {
            String query = "select count(*) from likes where pid=?";
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setInt(1, pid);
            
            ResultSet rst = psmt.executeQuery();
            
            if(rst.next()) {
                count = rst.getInt("count(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return count;
    }
    
    public boolean isAlreadyLiked(int pid, int uid) {
        boolean liked = false;
        
        try {
            String query = "select * from likes where pid=? and uid=?";
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setInt(1, pid);
            psmt.setInt(2, uid);
            
            ResultSet rst = psmt.executeQuery();
            
            if(rst.next()) {
                liked = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return liked;
    }
    
    public void dislike(int pid, int uid) {
        
        try {
            String query = "delete from likes where pid=? and uid=?";
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setInt(1, pid);
            psmt.setInt(2, uid);
            
            psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
    public String getCssClass(int pid, int uid) {
        String cssClass = "something";
        try {
            String query = "select * from likes where pid=? and uid=?";
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setInt(1, pid);
            psmt.setInt(2, uid);
            
            ResultSet rst = psmt.executeQuery();
            
            if(rst.next()) {
                cssClass = rst.getString("cssClass");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cssClass;
    }
}
