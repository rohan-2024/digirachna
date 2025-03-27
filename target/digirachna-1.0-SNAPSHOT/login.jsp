<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Registration- DigiRachna</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f4f8; /* Light gray background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .navbar {
            background-color: #343a40; /* Dark background for contrast */
            transition: background-color 0.3s;
        }

        .navbar-brand {
            font-weight: bold;
            color: #ffffff !important; /* White color for the logo text */
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

        .auth-container {
            display: flex;
            width: 100%;
            max-width: 700px;
            background: #e9ecef; 
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            position: relative;
        }

        .form-content {
            flex: 1;
            padding: 2rem;
            transition: transform 0.5s ease, opacity 0.5s ease;
            display: none; /* Hide by default */
        }

        .form-content.active {
            display: block; /* Show active form */
        }

        .form-title {
            font-size: 1.75rem;
            color: #007bff; /* Blue color for titles */
            margin-bottom: 1rem;
            font-weight: 700;
            transition: color 0.3s ease;
        }

        .form-control {
            margin-bottom: 1rem;
        }

        .btn-custom {
            background-color: #007bff; /* Blue color for buttons */
            color: white;
            font-weight: 500;
            border-radius: 20px;
        }

        .toggle-switch {
            position: absolute;
            top: 10px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .toggle-switch input {
            display: none;
        }

        .toggle-switch-label {
            background-color: #007bff; /* Blue color for toggle */
            border-radius: 50px;
            cursor: pointer;
            width: 50px;
            height: 25px;
            position: relative;
            transition: background-color 0.3s ease;
        }

        .toggle-switch-label::before {
            content: "";
            position: absolute;
            top: 2px;
            left: 2px;
            width: 20px;
            height: 20px;
            background-color: #ffffff;
            border-radius: 50%;
            transition: left 0.3s ease;
        }

        input:checked + .toggle-switch-label {
            background-color: #0056b3;
        }

        input:checked + .toggle-switch-label::before {
            left: 27px;
        }

        .login-image {
            width: 100%;
            max-width: 300px;
            margin-bottom: 20px;
            margin-top: 20px;
            background-color: rgba(0, 0, 0, 0.4); /* Semi-transparent background for logo */
            border-radius: 10px;
            padding: 10px;
        }
    </style>
</head>
<body>

<div class="auth-container">
    <div class="toggle-switch">
        <input type="checkbox" id="toggleCheckbox">
        <label for="toggleCheckbox" class="toggle-switch-label"></label>
    </div>

    <nav class="navbar navbar-expand-lg fixed-top navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="img/logo3.jpg" alt="DigiRachna Logo" height="30">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="categories.jsp">Categories</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="form-content active" id="loginForm">
        <div class="d-flex justify-content-center">
            <img src="img/digiRachna-removebg-preview.png" alt="DigiRachna" class="login-image">
        </div>
        <h2 class="form-title">Login</h2>
        <form action="LoginServlet" method="post">
            <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
            <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
            <button type="submit" class="btn btn-custom w-100 mb-3">Login</button>
        </form>
        <p class="text-center">
            <a href="#" class="text-decoration-none" id="switchToRegister">Don't have an account? Register</a>
        </p>
    </div>

    <div class="form-content" id="registerForm">
        <div class="d-flex justify-content-center">
            <img src="img/digiRachna-removebg-preview.png" alt="DigiRachna" class="login-image">
        </div>
        <h2 class="form-title">Register</h2>
        <form action="BloggerServlet" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="col-6">
                    <input type="text" name="name" class="form-control" placeholder="Enter your name" required>
                </div>
                <div class="col-6">
                    <input type="text" name="address" class="form-control" placeholder="Enter your address" required>
                </div>
                <div class="col-6">
                    <input type="text" name="contact" class="form-control" placeholder="Enter your contact" required>
                </div>
                <div class="col-6">
                    <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
                </div>
                <div class="col-6">
                    <input type="password" name="password" class="form-control" placeholder="Create a password" required>
                </div>
                <div class="col-6">
                    <label class="form-label">Upload your photo</label>
                    <input type="file" name="photo" class="form-control" required>
                </div>
            </div>
            <button type="submit" class="btn btn-custom w-100 mt-3">Register</button>
        </form>
        <p class="text-center">
            <a href="#" class="text-decoration-none" id="switchToLogin">Already have an account? Login</a>
        </p>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    const toggleCheckbox = document.getElementById('toggleCheckbox');
    const loginForm = document.getElementById('loginForm');
    const registerForm = document.getElementById('registerForm');
    const switchToRegister = document.getElementById('switchToRegister');
    const switchToLogin = document.getElementById('switchToLogin');

    toggleCheckbox.addEventListener('change', function () {
        if (this.checked) {
            loginForm.classList.remove('active');
            registerForm.classList.add('active');
        } else {
            registerForm.classList.remove('active');
            loginForm.classList.add('active');
        }
    });

    switchToRegister.addEventListener('click', function (e) {
        e.preventDefault();
        toggleCheckbox.checked = true;
        loginForm.classList.remove('active');
        registerForm.classList.add('active');
    });

    switchToLogin.addEventListener('click', function (e) {
        e.preventDefault();
        toggleCheckbox.checked = false;
        registerForm.classList.remove('active');
        loginForm.classList.add('active');
    });
</script>

</body>
</html>
