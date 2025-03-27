<%@page import="com.blog.entity.Blog"%>
<%@page import="com.blog.dao.BlogDao"%>
<%@page import="com.helper.FactoryProduct"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Business - DigiRachna</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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
            display: flex;
            align-items: center;
        }
        .navbar-brand img { 
            width: 150px; 
            height: 50px; 
            margin-right: 10px; 
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
        .category-header {
            background: url('img/headerBusiness.jpg') no-repeat center center/cover;
            height: 60vh;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .category-header h1 {
            font-size: 3rem;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }
        .category-header img {
            width: 250px;
            height: 100px;
            margin-bottom: 20px;
            background: #636d77;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.6);
        }
        .article-card {
            border: none;
            border-radius: 12px;
            transition: transform 0.3s;
        }
        .article-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
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
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="img/logo3.jpg" alt="Rohan axis Logo"> 
                </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="categories.jsp">Categories</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Category Header -->
    <section class="category-header">
        <div>
            <img src="img/digiRachna-removebg-preview.png" alt="DigiRachna Logo"> 
            <h1>Business</h1>
            <p>Insights, strategies, and tips for success in the business world.</p>
        </div>
    </section>
    <%
        BlogDao blogDao = new BlogDao(FactoryProduct.getFactory());
        List<Blog> blogList = blogDao.getAllBlog();
    %>

    <!-- Articles Section -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-4">Latest Articles</h2>
            <div class="row">
                <!-- Article Card 1 -->
                <div class="col-md-4 mb-4">
                    <div class="card article-card">
                        <img src="img/tips.jpg" class="card-img-top" alt="Article Image 1">
                        <div class="card-body">
                            <h5 class="card-title">10 Essential Tips for Startups</h5>
                            <p class="card-text">Guidelines to navigate the challenges of starting a new business.</p>
                            <div class="d-flex justify-content-between align-items-center">
                            <a href="#" class="btn btn-warning">Read More</a>
                            <span class="text-muted"><i class="fas fa-eye"></i> 2,345 views</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Article Card 2 -->
                <div class="col-md-4 mb-4">
                    <div class="card article-card">
                        <img src="img/socialmedia.jpg" class="card-img-top" alt="Article Image 2">
                        <div class="card-body">
                            <h5 class="card-title">The Impact of Social Media on Business</h5>
                            <p class="card-text">Exploring how social media shapes modern business strategies.</p>
                             <div class="d-flex justify-content-between align-items-center">
                            <a href="#" class="btn btn-warning">Read More</a>
                            <span class="text-muted"><i class="fas fa-eye"></i> 2,345 views</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Article Card 3 -->
                <div class="col-md-4 mb-4">
                    <div class="card article-card">
                        <img src="img/financial.jpg" class="card-img-top" alt="Article Image 3">
                        <div class="card-body">
                            <h5 class="card-title">Financial Management for Entrepreneurs</h5>
                            <p class="card-text">Key strategies to manage finances effectively in a startup.</p>
                             <div class="d-flex justify-content-between align-items-center">
                            <a href="#" class="btn btn-warning">Read More</a>
                            <span class="text-muted"><i class="fas fa-eye"></i> 2,345 views</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Rest of the Article Card  -->
                <%
                    for(Blog b: blogList) {
                        if(b.getCategory().equals("Business") && b.getStatus().equals("Published")) {
                %>
                    <div class="col-md-4 mb-4">
                        <div class="card article-card">
                            <img src="img/thumbnail/<%= b.getThumbnail() %>" class="card-img-top" alt="Article Image 1">
                            <div class="card-body">
                                <h5 class="card-title"><%= b.getTitle() %></h5>
                                <p class="card-text"><%= b.getTitle() %></p>
                                <form action="BlogPostServlet" method="post">
                                    <input type="text" hidden name="action" value="updateViewCount">
                                    <input type="text" hidden name="blogId" value="<%= b.getId() %>">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <button type="submit" class="btn btn-warning">Read More</button>
                                        <span class="text-muted"><i class="fas fa-eye"></i> <%= b.getViews() %> views</span>
                                    </div>
                                </form>                       
                            </div>
                        </div>
                    </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 DigiRachna. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
