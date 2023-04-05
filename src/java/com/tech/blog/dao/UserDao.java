
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //METHOD TO INSERT USER DETAILS
    public boolean saveUser(User user) {
        boolean flag = false;
        try {
            String query = "insert into user (username, phone, email, password, profile, coverpic) values(?,?,?,?, ?, ?);";
            PreparedStatement stmt = this.con.prepareStatement(query);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPhone());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPassword());
            stmt.setString(5, "default.jpg");
            stmt.setString(6, "default.png");
            
            stmt.executeUpdate();
            flag = true;
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public User getUserbyEmailAndPassword(String email, String password) {
        User user = null;
        
        try {
            String query = "select * from user where email=? and password=?;";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            
            ResultSet rst = pst.executeQuery();
            
            if(rst.next()) {
                int id = rst.getInt("id");
                String name = rst.getString("username");
                String phone = rst.getString("phone");
                String usermail = rst.getString("email");
                String pass = rst.getString("password");
                String profile = rst.getString("profile");
                String coverPic = rst.getString("coverpic");
                user = new User(id, name, phone, usermail, pass, profile, coverPic);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    public User getUserbyUserId(int userId) {
        User user = null;
        
        try {
            String query = "select * from user where id=?;";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, userId);
            
            ResultSet rst = pst.executeQuery();
            
            if(rst.next()) {
                int id = rst.getInt("id");
                String name = rst.getString("username");
                String phone = rst.getString("phone");
                String usermail = rst.getString("email");
                String pass = rst.getString("password");
                String profile = rst.getString("profile");
                String coverPic = rst.getString("coverpic");
                user = new User(id, name, phone, usermail, pass, profile, coverPic);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    public boolean updateUser(User user) {
        boolean flag = false;
        try {
            String query = "Update user set username='"+user.getUsername()+"', phone='"+ user.getPhone() +"',email='"+ user.getEmail()+"' where id="+user.getId();
            PreparedStatement statement = con.prepareStatement(query);
            statement.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public boolean updateUserProfile(User user) {
        boolean flag = false;
        try {
            String query = "Update user set profile='"+user.getProfile()+"' where id="+user.getId();
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public boolean updateCoverPhoto(User user) {
        boolean flag = false;
        try {
            String query = "Update user set coverpic='"+user.getCover()+"' where id="+user.getId();
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public boolean deleteAccount(int uid) {
        boolean flag = false;
        try {
            //FIND IS THERE ANY POST POSTED BY THIS USER, IF ANY DELETE THEM FIRST
            String findPost = "Select * from posts where uid=?";
            PreparedStatement psmtPost = this.con.prepareStatement(findPost);
            psmtPost.setInt(1, uid);
            ResultSet rstPost = psmtPost.executeQuery();
            if(rstPost.next()) {
                String deletePost = "delete from posts where uid=?";
                PreparedStatement psmtPostDelete = this.con.prepareStatement(deletePost);
                psmtPostDelete.setInt(1, uid);
                psmtPostDelete.executeUpdate();
            }
            
            //FIND IS THERE ANY LIKE BY THIS USER, IF ANY DELETE THEM FIRST
            String findLike = "Select * from likes where uid=?";
            PreparedStatement psmtLike = this.con.prepareStatement(findLike);
            psmtLike.setInt(1, uid);
            ResultSet rstLike = psmtLike.executeQuery();
            if(rstLike.next()) {
                String deleteLike = "delete from likes where uid=?";
                PreparedStatement psmtLikeDelete = this.con.prepareStatement(deleteLike);
                psmtLikeDelete.setInt(1, uid);
                psmtLikeDelete.executeUpdate();
            }
            
            String deleteUser = "delete from user where id=?";
            PreparedStatement psmtUser = this.con.prepareStatement(deleteUser);
            psmtUser.setInt(1, uid);
            psmtUser.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
