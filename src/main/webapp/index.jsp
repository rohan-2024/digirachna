
<%@page import="com.blog.entity.Blog"%>
<%@page import="com.blog.dao.BlogDao"%>
<%@page import="com.helper.FactoryProduct"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome to DigiRachna</title>
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
  
    /* Hero Section Styling */
    .hero-section {
      background: url('img/hero2.jpg') no-repeat center center/cover;
      height: 80vh;
      color: #fff;
      position: relative;
      text-align: center;
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: hidden;
      background-attachment: fixed;
    }
    .hero-overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.5);
      z-index: 1;
    }
    .hero-content {
      position: relative;
      z-index: 2;
      animation: fadeIn 1s ease-in-out;
    }
    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }
    .hero-content h1 {
      font-size: 3.5rem;
      font-weight: 700;
      text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
    }
    .hero-content p {
      font-size: 1.3rem;
      margin-top: 15px;
    }
    .hero-btn {
      background-color: #ffc107;
      color: #333;
      border: none;
      padding: 10px 30px;
      border-radius: 25px;
      font-size: 1.1rem;
      transition: background-color 0.3s, transform 0.3s;
    }
    .hero-btn:hover {
      background-color: #ffb100;
      transform: scale(1.05);
    }
    .category-card {
      border: none;
      border-radius: 12px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease-in-out;
    }
    .category-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
    }
    .card-img-overlay {
      background: rgba(0, 0, 0, 0.5);
      color: #fff;
      padding: 1rem;
      border-radius: 12px;
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
    /* Newsletter Section */
    .newsletter-form input[type="email"]:invalid {
      border-color: red;
    }
    /* Back to Top Button */
    .back-to-top {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background-color: #ffc107;
      border: none;
      border-radius: 50%;
      padding: 10px 15px;
      display: none; /* Initially hidden */
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .back-to-top:hover {
      background-color: #ffb100;
    }
  </style>
</head>
<body>
  <%
     BlogDao blogDao=new BlogDao(FactoryProduct.getFactory());
     List<Blog> blogList=blogDao.getAllBlog();
  %>
  <nav class="navbar navbar-expand-lg fixed-top navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#"><img src="img/logo3.jpg" alt="DigiRachna Logo" height="30"></a> 
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
          <li class="nav-item"><a class="nav-link" href="categories.jsp">Categories</a></li>
          <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
          <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <section class="hero-section">
    <div class="hero-overlay"></div>
    <div class="hero-content">
      <h1>Welcome to</h1><img src="img/digiRachna-removebg-preview.png">
      <p>Discover a world of stories, insights, and inspiration across various categories.</p>
      <a href="#categories" class="btn hero-btn">Explore Categories</a>
    </div>
  </section>

  <div class="container mt-4">
    <form class="d-flex justify-content-center">
      <input type="text" class="form-control w-50" placeholder="Search blogs..." aria-label="Search">
      <button class="btn btn-warning" type="submit">Search</button>
    </form>
  </div>

  <section id="categories" class="py-5">
    <div class="container">
      <div class="text-center mb-5">
        <h2>Popular Categories</h2>
        <p>Dive into the topics that interest you the most.</p>
      </div>
      <div class="row">
        <div class="col-md-4 mb-4">
          <div class="card category-card">
            <img src="img/cardLifestyle.webp" class="card-img" alt="Lifestyle">
            <div class="card-img-overlay">
              <h5 class="card-title">Lifestyle</h5>
              <p class="card-text">Get tips on health, fashion, and daily well-being.</p>
              <a href="lifestyle.jsp" class="btn btn-light">Explore</a>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card category-card">
            <img src="img/cardTechnology.webp" class="card-img" alt="Technology">
            <div class="card-img-overlay">
              <h5 class="card-title">Technology</h5>
              <p class="card-text">Latest updates and trends in tech and gadgets.</p>
              <a href="technology.jsp" class="btn btn-light">Explore</a>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card category-card">
            <img src="img/cardBusiness.webp" class="card-img" alt="Business">
            <div class="card-img-overlay">
              <h5 class="card-title">Business</h5>
              <p class="card-text">Insights into the business world and finance.</p>
              <a href="business.jsp" class="btn btn-light">Explore</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section id="featured-blogs" class="py-5 bg-light">
    <div class="container">
      <div class="text-center mb-5">
        <h2>Featured Blogs</h2>
        <p>Catch up on the latest from our contributors.</p>
      </div>
      <div class="row">
        <div class="col-md-4 mb-4">
          <div class="card">
            <img src="img/thumbnailTravelDestination.webp" class="card-img-top" alt="Blog Image 1">
            <div class="card-body">
              <h5 class="card-title">Top Travel Destinations in 2024</h5>
              <p class="card-text">Explore the must-visit places for the year.</p>
              <div class="d-flex justify-content-between align-items-center">
                <a href="blogPostLifestyle.jsp" class="btn btn-warning">Read More</a>
                <span class="text-muted"><i class="fas fa-eye"></i> 2,345 views</span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card">
            <img src="img/thumbnailAi.webp" class="card-img-top" alt="Blog Image 2">
            <div class="card-body">
              <h5 class="card-title">AI and the Future</h5>
              <p class="card-text">What AI advancements mean for us all.</p>
              <div class="d-flex justify-content-between align-items-center">
                <a href="blogPostTech.jsp" class="btn btn-warning">Read More</a>
                <span class="text-muted"><i class="fas fa-eye"></i> 2,345 views</span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card">
            <img src="img/thumbnailEntrepreneur.jpeg" class="card-img-top" alt="Blog Image 3">
            <div class="card-body">
              <h5 class="card-title">Finance Tips for Entrepreneurs</h5>
              <p class="card-text">Tips on managing finances as a startup founder.</p>
              <div class="d-flex justify-content-between align-items-center">
                <a href="blogPostFinance.jsp" class="btn btn-warning">Read More</a>
                <span class="text-muted"><i class="fas fa-eye"></i> 2,345 views</span>
              </div>
            </div>
          </div>
        </div>
        <%
          for(Blog b:blogList){
            if(b.getStatus().equals("Published")){
        %>
        <div class="col-md-4 mb-4">
          <div class="card">
            <img src="img/thumbnail/<%= b.getThumbnail() %>" class="card-img-top" alt="Blog Image">
            <div class="card-body">
              <h5 class="card-title"><%= b.getTitle() %></h5>
              <p class="card-text"><%= b.getTitle() %></p> 
              <form action="BlogPostServlet" method="post">
                <input type="text" hidden name="action" value="updateViewCount">
                <input type="text" hidden name="blogId" value="<%= b.getId() %>">
                <div class="d-flex justify-content-between align-items-center">
                  <button type="submit" class="btn btn-warning">Read More</a>
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

  <section class="py-5 text-center bg-dark text-white">
    <div class="container">
      <h2>Stay Updated</h2>
      <p>Subscribe to our newsletter for the latest blog updates, insights, and more!</p>
      <form class="d-flex justify-content-center mt-4 newsletter-form" onsubmit="return validateEmail()">
        <input type="email" class="form-control w-50 me-2" placeholder="Enter your email" required>
        <button type="submit" class="btn btn-warning">Subscribe</button>
      </form>
    </div>
  </section>

  <footer class="footer">
    <div class="container">
      <p>&copy; 2024 DigiRachna. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </div>
  </footer>

  <button class="back-to-top" onclick="scrollToTop()">
    <i class="fas fa-chevron-up"></i>
  </button>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Show Back to Top Button
    window.onscroll = function() {
      const button = document.querySelector('.back-to-top');
      if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
        button.style.display = "block";
      } else {
        button.style.display = "none";
      }
    };

    // Scroll to Top Function
    function scrollToTop() {
      window.scrollTo({top: 0, behavior: 'smooth'});
    }

    // Email Validation
    function validateEmail() {
      const emailInput = document.querySelector('input[type="email"]');
      if (!emailInput.value.includes('@')) {
        alert('Please enter a valid email address.');
        return false;
      }
      return true;
    }
  </script>
</body>
</html>