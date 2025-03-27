<%@page import="com.blog.entity.Blog"%>
<%@page import="com.blog.entity.Comments"%>
<%@page import="com.blog.dao.BlogDao"%>
<%@page import="com.blog.dao.CommentsDao"%>
<%@page import="com.helper.FactoryProduct"%>
<%@page import="java.util.List"%>

<%@include file="components/header.jsp" %>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        .profile-header {
            text-align: center;
            padding: 3rem 0;
            background: linear-gradient(135deg, #4a90e2, #6a5acd);
            color: #fff;
            position: relative;
        }
        .profile-header img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            transition: transform 0.3s ease-in-out;
        }
        .profile-header img:hover {
            transform: scale(1.1);
        }
        .profile-header h2 {
            margin-top: 1rem;
            font-size: 2rem;
        }
        .profile-header p {
            font-size: 1.2rem;
        }
        .edit-profile-btn {
            position: absolute;
            right: 20px;
            bottom: 20px;
            background-color: #fff;
            color: #4a90e2;
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
        }
        .edit-profile-btn:hover {
            background-color: #4a90e2;
            color: #fff;
        }
        .profile-info {
            margin-top: -2rem;
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.15);
            animation: fadeInUp 1s ease-out;
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .profile-info h3 {
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
            color: #4a90e2;
        }
        .profile-info .info-item {
            margin-bottom: 1rem;
        }
        .profile-info .info-item span {
            font-weight: bold;
            margin-right: 10px;
            color: #333;
        }
        .social-media {
            margin-top: 2rem;
        }
        .social-media a {
            margin: 0 10px;
            font-size: 1.5rem;
            color: #4a90e2;
            transition: transform 0.3s ease-in-out;
        }
        .social-media a:hover {
            transform: scale(1.2);
            color: #333;
        }
        .statistics-overview {
            margin-top: 2rem;
            padding: 2rem;
            background: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.15);
            animation: fadeIn 1.5s ease-in-out;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        .statistics-overview h3 {
            color: #4a90e2;
        }
        .statistics-overview .stat-item {
            display: flex;
            justify-content: space-between;
            padding: 1rem;
            background: #fff;
            margin-bottom: 1rem;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 2s ease-in-out;
            transition: transform 0.3s ease-in-out;
        }
        .statistics-overview .stat-item:hover {
            transform: scale(1.02);
        }
        .statistics-overview .stat-item span {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>
<%
       BlogDao blogDao=new BlogDao(FactoryProduct.getFactory());
        CommentsDao commentDao=new CommentsDao(FactoryProduct.getFactory());
        List<Comments> commentList=commentDao.getAllComments();
        List<Blog> blogList=blogDao.getAllBlog();
        int views=blogDao.getTotalViewCount();
        int comments=commentList.size();
        int posts=blogList.size();
        
    %>
<div class="profile-header">
    <img src="../img/adminPhoto/<%= admin.getPhoto() %>" alt="Profile Picture">
    <h2><%= admin.getName() %></h2>
    
</div>

<div class="container">
    <div class="profile-info">
        <h3>Personal Information</h3>
        <div class="info-item">
            <span>Email:</span> <%= admin.getEmail() %>
        </div>
        <div class="info-item">
            <span>Phone:</span> <%= admin.getContact() %>
        </div>
        
        
        
        <div class="social-media">
            <h3>Connect with me</h3>
            <a href="https://in.linkedin.com/in/rohan-singh-600853261" target="_blank"><i class="bi bi-linkedin"></i></a>
            <a href="https://github.com/rohan-2024" target="_blank"><i class="bi bi-github"></i></a>
            <a href="https://www.instagram.com/rohanaxis000/?hl=en" target="_blank"><i class="bi bi-instagram"></i></a>
            
        </div>
    </div>

    <div class="statistics-overview">
        <h3>Statistics Overview</h3>
        <div class="stat-item">
            <span>Total Posts</span>
            <span><%= posts %></span>
        </div>
        <div class="stat-item">
            <span>Total Comments</span>
            <span><%= comments %></span>
        </div>
        <div class="stat-item">
            <span>Total Views</span>
            <span><%= views %></span>
        </div>
    </div>
</div>


</body>
</html>
