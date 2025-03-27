<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Post - DigiRachna</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
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
        .blog-header {
            background: url('img/thumbnailTravelDestination.webp') no-repeat center center/cover;
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
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="img/logo3.jpg" alt="Rohan axis Logo" style="width: 150px; height: 50px; margin-right: 10px;">
             <img src="img/digiRachna-removebg-preview.png" alt="Second Logo" style="width: 90px; height: 50px;">
          
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

    <!-- Blog Header -->
    <section class="blog-header">
        <div>
            <h1>Top Travel Destinations in 2024</h1>
            <p class="lead">Discover where to go next year!</p>
        </div>
    </section>

    <!-- Blog Post Content -->
    <div class="container blog-post">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum euismod, nisl nec convallis scelerisque, nisi nunc bibendum nunc, vitae bibendum magna nisi nec libero. Praesent vel justo non ligula finibus dictum.</p>
                <h3>Why Visit These Destinations?</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eu nisi vehicula, malesuada augue a, dapibus nulla. Quisque feugiat, nulla ut interdum gravida, erat felis sollicitudin nulla, ac tincidunt libero ex ac lorem.</p>
                <h3>Tips for Traveling</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum euismod, nisl nec convallis scelerisque, nisi nunc bibendum nunc, vitae bibendum magna nisi nec libero. Praesent vel justo non ligula finibus dictum.</p>
                
                <div class="author-info">
                    <p><strong>Author:</strong> Jane Doe</p>
                    <p><strong>Published on:</strong> January 1, 2024</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Comments Section -->
    <div class="container comment-section">
        <h2>Comments</h2>
        <form class="mt-4">
            <div class="mb-3">
                <input type="text" class="form-control" placeholder="Your Name" required>
            </div>
            <div class="mb-3">
                <textarea class="form-control" rows="4" placeholder="Your Comment" required></textarea>
            </div>
            <button type="submit" class="btn btn-warning">Post Comment</button>
        </form>
        <hr>
        <div class="comments-list">
            <p><strong>John Smith:</strong> Great article! Can't wait to visit these places.</p>
            <p><strong>Emily Davis:</strong> Thanks for the recommendations!</p>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 DigiRachna. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
