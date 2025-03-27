/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.blog.servlet;

import com.blog.dao.BlogDao;
import com.blog.dao.CommentsDao;
import com.blog.entity.Blog;
import com.blog.entity.Comments;
import com.helper.FactoryProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author snghr
 */
@WebServlet(name = "CommentServlet", urlPatterns = {"/CommentServlet"})
public class CommentServlet extends HttpServlet {

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
           
            String type=request.getParameter("type");
            int blogId=Integer.parseInt(request.getParameter("blogId"));   
            BlogDao blogdao=new BlogDao(FactoryProduct.getFactory());
                  
            CommentsDao commentsDao=new CommentsDao(FactoryProduct.getFactory());
            Comments comments=new Comments();
            
            HttpSession h=request.getSession();
            
            if(type.equals("add")){
              String userName=request.getParameter("userName");
                String userEmail=request.getParameter("userEmail");
                String comment=request.getParameter("comment");
                
                if(userEmail==null || (userEmail.strip()).equals("")){
                    userEmail="anonymous";
                }
                     LocalDate l=LocalDate.now();
                     DateTimeFormatter format=DateTimeFormatter.ofPattern("dd-MM-yyyy");
                     String commentDate=l.format(format);
                     Blog blog=blogdao.getBlogByBlogId(blogId);
                   
                    comments.setBlog(blog);
                    comments.setComment(comment);
                    comments.setCommentDate(commentDate);
                    comments.setUserEmail(userEmail);
                    comments.setUserName(userName);
                    commentsDao.saveComment(comments);
                    
                    blogdao.updateBlogComment(blogId, comments);
                    h.setAttribute("message", "You have successfully commented on this post");
                    response.sendRedirect("blogPost.jsp?id="+blogId);
                
            }else{
                String user=request.getParameter("user");
                
                int commentId=Integer.parseInt(request.getParameter("commentId"));
                commentsDao.deleteComment(commentId);
                 h.setAttribute("message", "You have successfully deleted the comment on this post");
                 if(user.equals("blogger")){
                    response.sendRedirect("Blogger/posts.jsp");
                 }else if(user.equals("admin")){
                     response.sendRedirect("Admin/posts.jsp");
                 }
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
