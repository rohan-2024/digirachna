/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.blog.servlet;

import com.blog.dao.AdminDao;
import com.blog.dao.BloggerDao;
import com.helper.FactoryProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

/**
 *
 * @author snghr
 */
@MultipartConfig
@WebServlet(name = "ChangeServlet", urlPatterns = {"/ChangeServlet"})
public class ChangeServlet extends HttpServlet {

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
            
            String action=request.getParameter("action");
            String user=request.getParameter("user");
            String BloggerId=request.getParameter("bloggerId");
            int bloggerId=0;
            if(BloggerId!=null){
                bloggerId=Integer.parseInt(BloggerId);
            }
            String AdminId=request.getParameter("adminId");
            int adminId=0;
            if(AdminId!=null){
             adminId=Integer.parseInt(AdminId);
            }
            
            BloggerDao bloggerDao=new BloggerDao(FactoryProduct.getFactory());
            AdminDao adminDao=new AdminDao(FactoryProduct.getFactory());
            HttpSession h=request.getSession();
            
            if(action.equals("password")){
              String newPassword=request.getParameter("newPassword");
              if(user.equals("blogger")){
              bloggerDao.updateBloggerDetails(bloggerId, newPassword,"password");
              h.removeAttribute("current-user");
              h.setAttribute("message", "Password updated successfully, Please login again");
              }
              else if(user.equals("admin")){
                  adminDao.updateAdmin(adminId,newPassword, "password");
                  h.removeAttribute("current-user");
                  h.setAttribute("message", "Password updated successfully, Please login again");
              }
              response.sendRedirect("login.jsp");
              
              
            }else if(action.equals("photo")){
                Part photo=request.getPart("photo");
                String path=null;
                if(user.equals("blogger")){
                path=request.getServletContext().getRealPath("img")+File.separator+"bloggerPhoto"+File.separator+photo.getSubmittedFileName();
                bloggerDao.updateBloggerDetails(bloggerId, photo.getSubmittedFileName(), "photo");
             
                }
                else if(user.equals("admin")){
                path=request.getServletContext().getRealPath("img")+File.separator+"adminPhoto"+File.separator+photo.getSubmittedFileName();
                adminDao.updateAdmin(adminId, photo.getSubmittedFileName(), "photo");
                }
                try{
                FileOutputStream fos=new FileOutputStream(path);
                InputStream is=photo.getInputStream();
                byte[] data=new byte[is.available()];
                
                is.read(data);
                fos.write(data);
                fos.close();
                
            }catch(Exception e){
                e.printStackTrace();
            }
           
             h.removeAttribute("current-user");
             h.setAttribute("message","Photo updated successfully, Please login again");
             response.sendRedirect("login.jsp");
            }
            else if(action.equals("status")){
                String status=request.getParameter("status");
                bloggerDao.updateBloggerDetails(bloggerId, status, action);
                 h.setAttribute("message","Blogger status changed successfully");
                 response.sendRedirect("Admin/users.jsp");
            }
             
        }catch(Exception e){
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
