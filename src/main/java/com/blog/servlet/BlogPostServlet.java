/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.blog.servlet;

import com.blog.dao.BlogDao;
import com.blog.entity.Blog;
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
@WebServlet(name = "BlogPostServlet", urlPatterns = {"/BlogPostServlet"})
public class BlogPostServlet extends HttpServlet {

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
            String blogId=request.getParameter("blogId");
            String title=request.getParameter("title");
            String content=request.getParameter("content");
            String category=request.getParameter("category");
            String status=request.getParameter("status");
            
             BlogDao bd=new BlogDao(FactoryProduct.getFactory());
            Blog b=new Blog();
                HttpSession h=request.getSession();
                
            int id=0;
            if(blogId!=null){
             id=Integer.parseInt(blogId);
            }
            if(action.equals("add") || action.equals("thumbnail")){
                
          Part thumbnail=request.getPart("thumbnail");
            
            String path=request.getServletContext().getRealPath("img")+File.separator+"thumbnail"+File.separator+thumbnail.getSubmittedFileName();
            try{
                FileOutputStream fos=new FileOutputStream(path);
                InputStream is=thumbnail.getInputStream();
                byte[] data=new byte[is.available()];
                
                is.read(data);
                fos.write(data);
                fos.close();
            }catch(Exception e){
                e.printStackTrace();
            }
            b.setThumbnail(thumbnail.getSubmittedFileName());
            if(action.equals("thumbnail")){
               
             bd.updateBlogThumbnail(id, thumbnail.getSubmittedFileName());
            h.setAttribute("message", "Thumbnail update successfully");
             response.sendRedirect("Blogger/posts.jsp");
            }
             else if(action.equals("add")){
            
            int bloggerId=Integer.parseInt(request.getParameter("bloggerId"));
            LocalDate l=LocalDate.now();
            DateTimeFormatter format=DateTimeFormatter.ofPattern("dd-MM-yyyy");
            String date=l.format(format);
            
           
            b.setBlogDate(date);
            b.setBloggerId(bloggerId);
            b.setCategory(category);
            b.setContent(content);
            b.setViews(0);
            b.setStatus(status);
           b.setTitle(title);
            
            bd.saveBlog(b);
           
            h.setAttribute("message", "Post done successfully");
            response.sendRedirect("Blogger/posts.jsp");
             }
           
            }
            else if(action.equals("edit")){
                String user=request.getParameter("user");
                bd.updateBlog(id, title, content, category, status);
            h.setAttribute("message", "Post updated successfully");
            
            if(user.equals("blogger")){
                response.sendRedirect("Blogger/posts.jsp");
            }else if(user.equals("admin")){
                response.sendRedirect("Admin/posts.jsp");
            }
            }
            else if(action.equals("updateViewCount")){
                bd.updateViewCount(id);
                response.sendRedirect("blogPost.jsp?id="+id);
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
