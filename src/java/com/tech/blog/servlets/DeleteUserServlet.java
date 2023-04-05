
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
public class DeleteUserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("currentUser");
            UserDao udao = new UserDao(ConnectionProvider.getConnection());
            String userProfile = user.getProfile();
            String userCover = user.getCover();
            List<String> postImages = new ArrayList<>();
            try {
                String allPosts = "Select * from posts where uid=?";
                PreparedStatement psmt = ConnectionProvider.getConnection().prepareStatement(allPosts);
                psmt.setInt(1, user.getId());
                ResultSet rst = psmt.executeQuery();
                
                while(rst.next()) {
                    String getImage = rst.getString("photo");
                    postImages.add(getImage);
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
            boolean userDeleted = udao.deleteAccount(user.getId());
            
            if(userDeleted) {
                
                if(!userProfile.equals("default.jpg")) {
                    String profileLocation = request.getRealPath("/")+"pics"+ File.separator +userProfile;
                    Helper.deleteFile(profileLocation);
                }
                
                if(!userCover.equals("default.png")) {
                    String coverLocation = request.getRealPath("/")+"coverPhotos"+ File.separator +userCover;
                    Helper.deleteFile(coverLocation);
                }
                
                for(int i=0; i<postImages.size(); i++) {
                    String postImg = postImages.get(i);
                    String postLocation = request.getRealPath("/")+"postImages"+ File.separator +postImg;
                    Helper.deleteFile(postLocation);
                }
                out.println("Deleted");
                session.removeAttribute("currentUser");
            } else {
                out.println("Error");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
