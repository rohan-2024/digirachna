<%@page import="com.blog.entity.Blog"%>
<%@page import="com.blog.entity.Blogger"%>
<%@page import="com.blog.entity.Comments"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.dao.BloggerDao"%>
<%@page import="com.blog.dao.BlogDao"%>
<%@page import="com.helper.FactoryProduct"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Post - Finance Tips for Entrepreneurs - BlogSphere</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <%
        int id=Integer.parseInt(request.getParameter("id"));
         BlogDao blogDao=new BlogDao(FactoryProduct.getFactory());
         Blog b=blogDao.getBlogByBlogId(id);
         BloggerDao bloggerDao=new BloggerDao(FactoryProduct.getFactory());
         Blogger blogger=bloggerDao.getBloggerById(b.getBloggerId());
         List<Comments> commentList=b.getComments();
    %>
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
       
        .navbar {
            background-color: rgba(52, 58, 64, 0.8);
            transition: background-color 0.3s;
        }
        .navbar-brand {
            font-weight: bold;
            color: #00d2ff !important;
            font-size: 1.8rem;
        }
        .navbar-nav .nav-link {
            color: #fff;
            font-weight: 500;
            transition: color 0.3s, transform 0.3s;
        }
        .navbar-nav .nav-link:hover {
            color: #ffc107;
            transform: scale(1.1);
        }
        .blog-header {
            background: url('../img/thumbnail/<%= b.getThumbnail() %>') no-repeat center center/cover;
            height: 50vh;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .blog-post {
            margin: 30px 0;
        }
        .author-info {
            margin-top: 20px;
            font-style: italic;
        }
        .comment-section {
            margin-top: 40px;
        }
        .footer {
            background-color: #343a40;
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }
        .footer a {
            color: #00d2ff;
            text-decoration: none;
        }
    </style>
</head>
<body>
  
  
    <!-- Blog Header -->
    <section class="blog-header">
        <div>
            <h1><%= b.getTitle() %></h1>
           
        </div>
    </section>
            <%@include file="../components/message.jsp" %>

    <!-- Blog Post Content -->
    <div class="container blog-post">
        <div class="row">
            <div class="col-md-8 offset-md-2">
             <%= b.getContent() %>
                <div class="author-info">
                    <p><strong>Author:</strong> <%= blogger.getName() %></p>
                    <p><strong>Published on:</strong> <%= b.getBlogDate() %></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Comments Section -->
    <div class="container comment-section">
        <h2>Comments</h2>
        <form action="CommentServlet" method="post" class="mt-4">
            <input type="text" hidden name="type" value="add">
            <input type="text" hidden name="blogId" value="<%= id %>">
            
            <div class="mb-3">
                <input type="text" name="userName" class="form-control" placeholder="Your Name" required>
            </div>
            <div class="mb-3">
                <input type="text" name="userEmail" class="form-control" placeholder="Your email (optional)">
            </div>
            
            <div class="mb-3">
                <textarea name="comment" class="form-control" rows="4" placeholder="Your Comment" required></textarea>
            </div>
            <button type="submit" class="btn btn-warning">Post Comment</button>
        </form>
        <hr>
        <div class="comments-list">
            <%
                                if(commentList!=null){
                                for(Comments c:commentList){
            %>
            <p><strong><%= c.getUserName() %>:</strong> <%= c.getComment() %>.</p>
          
<!--            <p><strong>Tom White:</strong> I appreciate the emphasis on cash flow management.</p>-->
            <%
                }
              }
            %>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 BlogSphere. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
