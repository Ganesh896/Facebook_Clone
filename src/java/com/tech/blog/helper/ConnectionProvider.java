
package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {
    
    private static Connection con;
    
    public static Connection getConnection() {
        
        try {
            if(con==null) {
                //Load Driver
                Class.forName("com.mysql.jdbc.Driver");

                //Connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TechBlog", "root", "Sep@2001");
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
