/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.blog.servlet;

import com.blog.dao.AdminDao;
import com.blog.dao.BloggerDao;
import com.blog.entity.Admin;
import com.blog.entity.Blogger;
import com.helper.FactoryProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author snghr
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
           String email=request.getParameter("email");
           String password=request.getParameter("password");
           
           AdminDao adao=new AdminDao(FactoryProduct.getFactory());
           Admin admin=adao.getAdminByEmailAndPassword(email, password);
           
           BloggerDao bdao=new BloggerDao(FactoryProduct.getFactory());
           Blogger blogger=bdao.getBloggerByEmailandPassword(email, password);
           
           HttpSession  h=request.getSession();
           
           if(admin!=null){
                h.setAttribute("current-user", admin);
                response.sendRedirect("Admin/dashboard.jsp");
           }else if(blogger!=null){
               if(blogger.getStatus().equals("Allow")){
               h.setAttribute("current-user", blogger);
                response.sendRedirect("Blogger/dashboard.jsp");
               }else{
                h.setAttribute("message", "You've been blocked to login, please contact administration for more information !");
                response.sendRedirect("login.jsp");
               }
           }else{
               h.setAttribute("message", "Wrong credentials, please try again");
               response.sendRedirect("login.jsp");
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
