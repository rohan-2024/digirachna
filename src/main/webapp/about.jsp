
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Me - DigiRachna</title>
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
      background: url('img/hero1.jpg') no-repeat center center/cover;
      height: 50vh;
      color: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
    }
    .mission, .about-me {
      margin: 50px 0;
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
    /* Remove text-align: center from body and container */
    body, .container {
      text-align: inherit;
    }

    /* Responsive Logo */
    .navbar-brand {
      display: flex;
      align-items: center;
    }

    .navbar-brand img {
      width: 150px;
      height: 50px;
    }

    @media (max-width: 768px) {
      .navbar-brand img {
        width: 100px;
        height: 30px;
      }
    }
  </style>
</head>
<body>
  <nav class="navbar navbar-expand-lg fixed-top navbar-dark">
    <div class="container">
      <a class="navbar-brand" href="#">
        <img src="img/logo3.jpg" alt="Logo">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="#">About</a></li>
          <li class="nav-item"><a class="nav-link" href="categories.jsp">Categories</a></li>
          <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <section class="hero-section">
    <div>
      <img src="img/digiRachna-removebg-preview.png">
      <h1>About Me</h1>
      <p class="lead">The Story Behind DigiRachna</p>
    </div>
  </section>

  <div class="container mission">
    <h2 class="text-center">My Mission</h2>
    <p class="text-center">DigiRachna is my personal project, driven by a passion for sharing ideas, knowledge, and stories. My goal is to inspire readers and foster a community around quality content that spans a variety of topics, all while ensuring authenticity and engagement.</p>
  </div>

  <div class="container about-me">
    <h2 class="text-center">About Me</h2>
    <div class="text-center">
      <img src="img/profile-pic.jfif" class="img-fluid rounded-circle" alt="My Picture"> 
      <h5>Rohan Singh</h5>
      <p>Founder, Developer, and Content Creator</p>
      <p>I am the sole creator behind DigiRachna, managing everything from development to content curation. This platform is a reflection of my passion for both technology and creativity, and I hope to inspire readers through my work.</p>
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