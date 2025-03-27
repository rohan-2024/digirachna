<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Us - DigiRachna</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
      background: url('img/headerContact.webp') no-repeat center center/cover;
      height: 50vh;
      color: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
    }
    .contact-info {
      margin: 50px 0;
    }
    .contact-info h5 {
      margin-bottom: 10px;
    }
    .icon {
      font-size: 2rem;
      color: #ffc107;
    }
    .contact-form {
      background-color: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      margin-top: 30px;
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
    .btn-warning {
      transition: background-color 0.3s, transform 0.3s;
    }
    .btn-warning:hover {
      background-color: #ffb100;
      transform: scale(1.05);
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
            <li class="nav-item"><a class="nav-link" href="categories.jsp">Categories</a></li>
            <li class="nav-item"><a class="nav-link active" href="#">Contact</a></li>
          <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <section class="hero-section">
    <div>
      <img src="img/digiRachna-removebg-preview.png" alt="DigiRachna" style="max-width: 250px; margin-bottom: 20px;"> 
      <h1>Contact me</h1>
      <p class="lead">I'd love to hear from you!</p>
    </div>
  </section>

  <div class="container contact-info">
    <h2 class="text-center">Get in Touch</h2>
    <p class="text-center">Whether you have a question, feedback, or just want to say hello, feel free to reach out!</p>
    <div class="row">
      <div class="col-md-4 text-center mb-4">
        <i class="fas fa-envelope icon"></i>
        <h5>Email</h5>
        <p><a href="snghrohan000@gmail.com">snghrohan000@gmail.com</a></p>
      </div>
      <div class="col-md-4 text-center mb-4">
        <i class="fas fa-phone-alt icon"></i>
        <h5>Phone</h5>
        <p><a href="tel:+1234567890">7739803214</a></p>
      </div>
      <div class="col-md-4 text-center mb-4">
        <i class="fas fa-map-marker-alt icon"></i>
        <h5>Address</h5>
        <p>Dehri<br>Bihar, 821305</p>
      </div>
    </div>
  </div>

  <div class="container">
    <div class="contact-form">
      <h2 class="text-center">Contact Form</h2>
      <form class="mt-4">
        <div class="row">
          <div class="col-md-6 mb-3">
            <input type="text" class="form-control" placeholder="Your Name" required>
          </div>
          <div class="col-md-6 mb-3">
            <input type="email" class="form-control" placeholder="Your Email" required>
          </div>
        </div>
        <div class="mb-3">
          <input type="text" class="form-control" placeholder="Subject" required>
        </div>
        <div class="mb-3">
          <textarea class="form-control" rows="5" placeholder="Your Message" required></textarea>
        </div>
        <button type="submit" class="btn btn-warning">Send Message</button>
      </form>
    </div>
  </div>

  <footer class="footer">
    <div class="container">
      <p>&copy; 2024 DigiRachna. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </div>
  </footer>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>