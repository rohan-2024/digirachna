<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Categories - DigiRachna</title>
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
    .navbar-nav .nav-link {
      color: #fff;
      font-weight: 500;
      transition: color 0.3s, transform 0.3s;
    }
    .navbar-nav .nav-link:hover {
      color: #ffc107;
      transform: scale(1.1);
    }
    .hero-section {
      background: url('./img/hero2.jpg') no-repeat center center/cover;
      height: 50vh;
      color: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
    }
    .hero-section h1 {
      font-size: 3rem;
      margin-top: 20px; 
    }
    .category-card {
      border: none;
      border-radius: 12px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease-in-out;
    }
    .category-card:hover {
      transform: translateY(-5px);
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
  <nav class="navbar navbar-expand-lg fixed-top navbar-dark">
    <div class="container">
      <a class="navbar-brand" href="#"><img src="img/logo3.jpg" alt="Rohan axis Logo" height="30"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
          <li class="nav-item"><a class="nav-link active" href="#">Categories</a></li>
          <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
          <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <section class="hero-section">
    <div>
      <img src="img/digiRachna-removebg-preview.png" alt="DigiRachna" style="max-width: 250px; margin-bottom: -40px;"> 
      <h1>Explore Our Categories</h1>
      <p class="lead">Discover articles across various topics that inspire and inform.</p>
    </div>
  </section>

  <div class="container py-5">
    <div class="text-center mb-5">
      <h2>Our Popular Categories</h2>
      <p>Click on a category to explore more.</p>
    </div>
    <div class="row">
      <div class="col-md-4 mb-4">
        <div class="card category-card">
          <img src="img/cardLifestyle.webp" class="card-img-top" alt="Lifestyle">
          <div class="card-body">
            <h5 class="card-title">Lifestyle</h5>
            <p class="card-text">Get tips on health, fashion, and daily well-being.</p>
            <a href="lifestyle.jsp" class="btn btn-warning">Explore Lifestyle</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-4">
        <div class="card category-card">
          <img src="img/cardTechnology.webp" class="card-img-top" alt="Technology">
          <div class="card-body">
            <h5 class="card-title">Technology</h5>
            <p class="card-text">Latest updates and trends in tech and gadgets.</p>
            <a href="technology.jsp" class="btn btn-warning">Explore Technology</a>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-4">
        <div class="card category-card">
          <img src="img/cardBusiness.webp" class="card-img-top" alt="Business">
          <div class="card-body">
            <h5 class="card-title">Business</h5>
            <p class="card-text">Insights into the business world and finance.</p>
            <a href="business.jsp" class="btn btn-warning">Explore Business</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <footer class="footer">
    <div class="container">
      <p>&copy; 2024 DigiRachna. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
