<%@page import="com.blog.entity.Blog"%>
<%@page import="com.blog.entity.Comments"%>
<%@page import="com.blog.dao.BlogDao"%>
<%@page import="com.blog.dao.CommentsDao"%>
<%@page import="com.helper.FactoryProduct"%>
<%@page import="java.util.List"%>

<%@include file="components/header.jsp" %>

<!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .sidebar {
            height: 100vh;
            width: 260px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #1d1f27;
            box-shadow: 4px 0 15px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }

        .sidebar .profile {
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar .profile img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .sidebar .profile h4 {
            color: #fff;
            margin: 0;
        }

        .sidebar .nav-link {
            color: #bbb;
            padding: 10px 20px;
            display: block;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar .nav-link:hover {
            color: #fff;
        }

        .sidebar .nav-link.active {
            background-color: #007bff;
            color: #fff;
        }

        .sidebar .dropdown-menu {
            background-color: #1d1f27;
        }

        .sidebar .dropdown-item {
            color: #bbb;
        }

        .sidebar .dropdown-item:hover {
            background-color: #007bff;
            color: #fff;
        }

        .content {
            margin-left: 260px;
            padding: 30px;
            background-color: #f0f2f5;
        }
            .sidebar-logo {
    width: 150px; /* Adjust width as needed */
    margin-bottom: 20px; /* Adjust margin as needed */
    display: block; /* Makes the logo a block element */
    margin-left: auto;
    margin-right: auto;
}

        .content-logo {
    width: 170px; /* Adjust width as needed */
    margin-bottom: 20px; /* Adjust margin as needed */
    float: right; /* Example: float logo to the left */
    margin-right: 20px;
    background: #73777b;
}
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .content {
                margin-left: 0;
                padding: 15px;
            }
        }

        .content h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            color: #2c3e50;
            font-weight: 700;
        }

        .content p.subtitle {
            font-size: 1.2rem;
            color: #7f8c8d;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            background: #fff;
            padding: 20px;
            text-align: center;
            color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card.bg-primary {
            background-color: #007bff;
        }

        .card.bg-success {
            background-color: #28a745;
        }

        .card.bg-danger {
            background-color: #dc3545;
        }

        .card.bg-warning {
            background-color: #ffc107;
        }

        .card-title {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 2rem;
            font-weight: 700;
        }

        /* Hover Effect */
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }

        /* Animation for card appearance */
        @keyframes cardAppear {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card {
            animation: cardAppear 0.6s ease-out;
        }

        .chart-container {
            margin-top: 30px;
        }

        .chart-container canvas {
            width: 100% !important;
            height: 700px !important;
        }

        @media (max-width: 768px) {
            .chart-container canvas {
                height: 300px !important;
            }
        }
    </style>
</head>
<body>
    <%
        BlogDao blogDao=new BlogDao(FactoryProduct.getFactory());
        CommentsDao commentDao=new CommentsDao(FactoryProduct.getFactory());
        List<Comments> commentList=commentDao.getAllCommentsByBloggerId(blogger.getId());
        List<Blog> blogList=blogDao.getAllRecentBlogByBloggerId(blogger.getId());
        int published=0;
        int draft=0;
        int underReview=0;
        for(Blog b:blogList){
            if(b.getStatus().equals("Published")){
            published=published+1;
        }else if(b.getStatus().equals("Draft")){
            draft=draft+1;
        }else if(b.getStatus().equals("UnderReview")){
            underReview=underReview+1;
        }
        }
        int views=blogDao.getViewCountbyBloggerId(blogger.getId());
        int comments=commentList.size();
        int posts=blogList.size();
        
    %>
    <%@include file="components/navbar.jsp" %>
    <div class="content">
                <img src="../img/digiRachna-removebg-preview.png" alt="Logo 2" class="content-logo">
        <h1>Statistics Overview</h1>
        <p class="subtitle">Key metrics and visual insights into your blog's performance.</p>

        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card bg-primary">
                    <div class="card-body">
                        <h5 class="card-title">Total Posts</h5>
                        <p class="card-text" id="total-posts"><%= posts %></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card bg-success">
                    <div class="card-body">
                        <h5 class="card-title">Total Comments</h5>
                        <p class="card-text" id="total-comments"><%= comments %></p>
                    </div>
                </div>
            </div>
          
            <div class="col-md-4 mb-4">
                <div class="card bg-danger">
                    <div class="card-body">
                        <h5 class="card-title">Total Views</h5>
                        <p class="card-text" id="total-views"><%= views %></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="chart-container">
            <h3>Post Status Distribution</h3>
    <canvas id="postStatusChart"></canvas>

        </div>
         
           <div class="chart-container">
    <!-- Comments per Post Chart -->
    <h3>Comments per Post</h3>
    <canvas id="commentsChart"></canvas>
           </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Chart.js -->
    <script>
       const postStatusData = {
      labels: ['Published', 'Draft', 'Under Review'],
      datasets: [{
        label: 'Post Status Distribution',
        data: [<%= published %>, <%= draft %>, <%= underReview %>],  // Sample data
        backgroundColor: ['#4CAF50', '#FFC107', '#FF5722'],
        hoverOffset: 4
      }]
    };

    // Sample Data for Comments per Post
    const commentsData = {
      labels: [<%
          for(Blog b:blogList){
      %>'Post <%= b.getId() %>', <% } %>],
      datasets: [{
        label: 'Comments per Post',
        data: [<%
          for(Blog b:blogList){ 
         %> '<%= b.getComments().size() %>'
        ,
        <% } %>
            ],  // Sample data
        backgroundColor: '#03A9F4',
        borderColor: '#0288D1',
        borderWidth: 1
      }]
    };

    // Config for Post Status Distribution Chart
    const postStatusConfig = {
      type: 'doughnut',
      data: postStatusData,
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top',
          }
        }
      },
    };

    // Config for Comments per Post Chart
    const commentsConfig = {
      type: 'bar',
      data: commentsData,
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true
          }
        }
      },
    };

    // Render the Post Status Distribution Chart
    const postStatusChart = new Chart(
      document.getElementById('postStatusChart'),
      postStatusConfig
    );

    // Render the Comments per Post Chart
    const commentsChart = new Chart(
      document.getElementById('commentsChart'),
      commentsConfig
    );
    </script>
</body>
</html>
