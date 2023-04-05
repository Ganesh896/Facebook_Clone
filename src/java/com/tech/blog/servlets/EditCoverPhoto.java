/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Dell
 */
@MultipartConfig
public class EditCoverPhoto extends HttpServlet {

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
            Part part = request.getPart("cover_photo");
            
            String imageName = part.getSubmittedFileName();
            
            HttpSession session = request.getSession();
            
            User currentUser = (User)session.getAttribute("currentUser");
            
            String oldCover = currentUser.getCover();
            
            currentUser.setCover(imageName);
            
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            boolean flag = dao.updateCoverPhoto(currentUser);
            
            if(flag) {
                String newCoverLocation = request.getRealPath("/")+"coverPhotos"+ File.separator +currentUser.getCover();
                
                if(!oldCover.equals("default.png")) {
                    String oldCoverLocation = request.getRealPath("/")+"coverPhotos"+ File.separator +oldCover;
                    Helper.deleteFile(oldCoverLocation);
                }
                
                if(Helper.saveFile(part.getInputStream(), newCoverLocation)) {
                    Message msg = new Message("Cover Photo Updated Successfully!", "success", "alert-success");
                    session.setAttribute("message", msg);
                } else {
                    Message msg = new Message("You have an Error!", "error", "alert-danger");
                    session.setAttribute("message", msg);
                }

            } else {
                Message msg = new Message("You have an Error!", "error", "alert-danger");
                session.setAttribute("message", msg);
            }
            
            response.sendRedirect("UserProfile.jsp");
        } catch(Exception e) {
            e.printStackTrace();
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
