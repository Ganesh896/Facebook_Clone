
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Dell
 */
public class PostDao {
    Connection con;
    
    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> category = new ArrayList<>();
        
        try {
            String query = "Select * from category";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(query);
            
            while(rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("cname");
                String description = rs.getString("descreption");
                
                Category ct = new Category(cid, name, description);
                
                category.add(ct);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return category;
    }
    
    public boolean savePost(Post p) {
        boolean flag = false;
        try {
            String query = "insert into posts(pdescription, photo, cid, uid, pdate) values(?, ?, ?, ?, ?)";
            PreparedStatement pstm = con.prepareStatement(query);
            
            pstm.setString(1, p.getPdescription());
            pstm.setString(2, p.getPhoto());
            pstm.setInt(3, p.getCid());
            pstm.setInt(4, p.getUid());
            pstm.setString(5, p.getPostDate());
            
            pstm.executeUpdate();
            
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        
        try {
            String query = "Select * from posts";
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rst = stmt.executeQuery();
            
            while(rst.next()) {
                int pid = rst.getInt("pid");
                String description = rst.getString("pdescription");
                String photo = rst.getString("photo");
                int cid = rst.getInt("cid");
                int uid = rst.getInt("uid");
                String postDate = rst.getString("pdate");
                
                Post post = new Post(pid, description, photo, cid, uid, postDate);
                
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public List<Post> getAllPostsByUser(int userId) {
        List<Post> list = new ArrayList<>();
        
        try {
            String query = "Select * from posts where uid="+userId;
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rst = stmt.executeQuery();
            
            while(rst.next()) {
                int pid = rst.getInt("pid");
                String description = rst.getString("pdescription");
                String photo = rst.getString("photo");
                int cid = rst.getInt("cid");
                int uid = rst.getInt("uid");
                String postDate = rst.getString("pdate");
                
                Post post = new Post(pid, description, photo, cid, uid, postDate);
                
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
}
