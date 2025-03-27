<%@page import="com.blog.entity.Blog"%>
<%@page import="com.blog.entity.Comments"%>
<%@page import="com.blog.dao.BlogDao"%>
<%@page import="com.blog.dao.CommentsDao"%>
<%@page import="com.helper.FactoryProduct"%>
<%@page import="java.util.List"%>

<%@include file="components/header.jsp" %>
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
            transition: width 0.3s;
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
            transition: margin-left 0.3s;
        }

        .content h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #2c3e50;
            font-weight: 700;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            transition: transform 0.4s ease-in-out, box-shadow 0.4s ease-in-out;
            background: linear-gradient(145deg, #007bff, #00d2ff);
            color: #fff;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }

        .card i {
            font-size: 2rem;
            margin-right: 15px;
        }

        .card h4 {
            font-size: 1.5rem;
            margin: 0;
        }

        .card p {
            font-size: 1.2rem;
            margin: 0;
        }

        .stats-card {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
        }

        .stats-card .icon {
            font-size: 3rem;
            color: rgba(255, 255, 255, 0.7);
        }

        .table-responsive {
            margin-top: 30px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .table th,
        .table td {
            vertical-align: middle;
        }

        .btn-action {
            border-radius: 20px;
            padding: 5px 15px;
            transition: all 0.3s ease-in-out;
        }

        .btn-action:hover {
            transform: translateY(-3px);
        }

        .chart-container {
            margin-top: 30px;
        }

        .chart-card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .chart-card h4 {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: #2c3e50;
        }

        .chart {
            height: 250px;
            background: #e9ecef;
            border-radius: 10px;
            position: relative;
            overflow: hidden;
        }

        .chart-placeholder {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #6c757d;
            font-size: 1.2rem;
        }

        .chart img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                box-shadow: none;
            }

            .content {
                margin-left: 0;
            }

            .sidebar .nav-link {
                padding: 15px;
            }
        }

        @media (max-width: 576px) {
            .sidebar .profile img {
                width: 60px;
                height: 60px;
            }

            .card i {
                font-size: 1.5rem;
            }

            .card h4 {
                font-size: 1.2rem;
            }

            .card p {
                font-size: 1rem;
            }

            .table th,
            .table td {
                font-size: 0.875rem;
            }

            .chart {
                height: 200px;
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
        int views=blogDao.getViewCountbyBloggerId(blogger.getId());
        int comments=commentList.size();
        int posts=blogList.size();
        
    %>
    <%@include file="components/navbar.jsp" %>
    <div class="content">
        <img src="../img/digiRachna-removebg-preview.png" alt="Logo 2" class="content-logo">
        <h1>Dashboard</h1>
        <%@include file="../components/message.jsp" %>
        <div class="row">
            <!-- Stats Cards -->
            <div class="col-md-4 col-6 mb-4">
                <div class="card stats-card">
                    <i class="fas fa-pencil-alt icon"></i>
                    <div>
                        <h4>Posts</h4>
                        <p><%= posts %></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-6 mb-4">
                <div class="card stats-card">
                    <i class="fas fa-comments icon"></i>
                    <div>
                        <h4>Comments</h4>
                        <p><%= comments %></p>
                    </div>
                </div>
            </div>
<!--            <div class="col-md-3 col-6 mb-4">
                <div class="card stats-card">
                    <i class="fas fa-thumbs-up icon"></i>
                    <div>
                        <h4>Likes</h4>
                        <p>1,200</p>
                    </div>
                </div>
            </div>-->
            <div class="col-md-4 col-6 mb-4">
                <div class="card stats-card">
                    <i class="fas fa-eye icon"></i>
                    <div>
                        <h4>Views</h4>
                        <p><%= views %></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Blogs Table -->
        <div class="table-responsive">
            <table class="table table-hover">
                <thead class="thead-light">
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Views</th>
                        <th>Comments</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                     <%
                                for(Blog b:blogList){
                       %>
                     <tr>
                                <td><%= b.getId() %></td>
                                <td><%= b.getTitle() %></td>
                                <td><%= b.getViews() %></td>
                                <td><%= b.getComments().size() %></td>
                                <td><%= b.getBlogDate() %></td>
                                <%
                                    if(b.getStatus().equals("Published")){
                                %>
                                <td><span class="badge bg-success">Published</span></td>
                                <%
                                    }else  if(b.getStatus().equals("Draft")){
                                %>
                                <td><span class="badge bg-warning">Draft</span></td>
                                <%
                                    }else if(b.getStatus().equals("UnderReview")){
                                %>
                                <td><span class="badge bg-danger">Under Review</span></td>
                                <%
                                    }
                                %>
                                <td>
<!--                                    <a href="#" class="btn btn-primary btn-action">View</a>-->
                                    <a href="editBlog.jsp?blogId=<%= b.getId() %>" class="btn btn-secondary btn-action">Edit</a>
                                    <button class="btn btn-danger btn-action">Delete</button>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                </tbody>
            </table>
        </div>

        <!-- Charts Section -->
        <div class="chart-container">
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="chart-card">
                        <h4>Recent Comments</h4>
                        <div class="chart">
                            <!-- Placeholder for Traffic Overview Chart -->
                            <div class="chart-placeholder">
                                <div class="recent-comments">
                                    <%
                                        for(Comments c:commentList){
                                    %>
                                    <div class="comment-item">
                                        <p><strong><%= c.getUserName() %> : </strong><span><%= c.getComment() %></p>
                                    </div>
                                   <%
                                       }
                                   %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="chart-card">
                        <h4>Engagement</h4>
                        <div class="chart">
                            <!-- Placeholder for Engagement Chart -->
                            <div class="chart-placeholder">
                                <canvas id="engagementChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

 

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
     
        // Engagement Chart
        var ctxEngagement = document.getElementById('engagementChart').getContext('2d');
        new Chart(ctxEngagement, {
            type: 'bar',
            data: {
                labels: ['Posts', 'Comments', 'views'],
                datasets: [{
                    label: 'Engagement Metrics',
                    data: [<%= posts %>, <%= comments %>, <%= views %> ],
                    backgroundColor: '#00d2ff',
                    borderColor: '#007bff',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    },
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.dataset.label + ': ' + tooltipItem.raw;
                            }
                        }
                    }
                }
            }
        });
        
       
    </script>
</body>
</html>
    