/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.blog.servlet;

import com.blog.dao.BloggerDao;
import com.blog.entity.Blogger;
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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author snghr
 */
@MultipartConfig
@WebServlet(name = "BloggerServlet", urlPatterns = {"/BloggerServlet"})
public class BloggerServlet extends HttpServlet {

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
           
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            String contact=request.getParameter("contact");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            Part photo=request.getPart("photo");
            
            String path=request.getServletContext().getRealPath("img")+File.separator+"bloggerPhoto"+File.separator+photo.getSubmittedFileName();
            
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
            
            LocalDate l=LocalDate.now();
            DateTimeFormatter format=DateTimeFormatter.ofPattern("dd-MM-yyyy");
            String date=l.format(format);
            
            BloggerDao bdao=new BloggerDao(FactoryProduct.getFactory());
            Blogger b=new Blogger();
            
            b.setAddress(address);
            b.setContact(contact);
            b.setEmail(email);
            b.setName(name);
            b.setPassword(password);
            b.setPhoto(photo.getSubmittedFileName());
            b.setRegistrationDate(date);
            b.setStatus("Allow");
            
            bdao.saveBlogger(b);
            
            HttpSession h=request.getSession();
            h.setAttribute("message", "Registration successful, please login");
            response.sendRedirect("index.jsp");
            
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
