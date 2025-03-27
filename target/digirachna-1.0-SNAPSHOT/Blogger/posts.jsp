<%@page import="com.blog.entity.Blog"%>
<%@page import="com.blog.dao.BlogDao"%>
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
            transition: all 0.3s ease;
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
            transition: margin-left 0.3s ease;
        }
        
        .content h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            color: #2c3e50;
            font-weight: 700;
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

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            background: #fff;
            padding: 20px;
        }

        .card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .card-header .btn {
            border-radius: 20px;
        }

        .table-responsive {
            margin-top: 30px;
        }

        .table th,
        .table td {
            vertical-align: middle;
        }

        .table th .sort-icon {
            cursor: pointer;
            margin-left: 10px;
            font-size: 0.9rem;
        }

        .btn-action {
            border-radius: 20px;
            padding: 5px 15px;
            transition: all 0.3s ease-in-out;
        }

        .btn-action:hover {
            transform: translateY(-3px);
        }

        .pagination {
            margin-top: 20px;
        }

        .header-section {
            margin-bottom: 20px;
        }

        .header-section .subtitle {
            font-size: 1.2rem;
            color: #6c757d;
            margin-bottom: 15px;
        }

        .header-section .filter-icon {
            font-size: 1.5rem;
            cursor: pointer;
        }

        @media (max-width: 991px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                box-shadow: none;
                transition: none;
            }

            .content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <%@include file="components/navbar.jsp" %>
    <%
        BlogDao blogDao=new BlogDao(FactoryProduct.getFactory());
        List<Blog> blogList=blogDao.getAllBlogByBloggerId(blogger.getId());
    %>
    <div class="content">
        <div class="header-section">
                    <img src="../img/digiRachna-removebg-preview.png" alt="Logo 2" class="content-logo">
            <h1>Manage Posts</h1>
            <p class="subtitle">View, edit, and manage your blog posts.</p>
            <div class="d-flex justify-content-between align-items-center">
                <a href="addBlog.jsp" class="btn btn-primary">Add New Post</a>
                <i class="fas fa-filter filter-icon" title="Filter Posts"></i>
            </div>
        </div>
        <div class="card">
            <%@include file="../components/message.jsp" %>
            <div class="card-body">
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Search posts..." aria-label="Search posts">
                </div>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead class="thead-light">
                            <tr>
                                <th>#</th>
                                <th>Title <i class="fas fa-sort sort-icon"></i></th>
<!--                                <th>Author <i class="fas fa-sort sort-icon"></i></th>-->
                                <th>Date <i class="fas fa-sort sort-icon"></i></th>
                                <th>Views</th>
                                <th>Comments</th>
                                <th>Status <i class="fas fa-sort sort-icon"></i></th>
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
                                <td><%= b.getBlogDate() %></td>
                                <td><%= b.getViews() %></td>
                                <td><%= b.getComments().size() %></td>
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
                                    <a href="viewBlog.jsp?id=<%= b.getId() %>" class="btn btn-primary btn-action">View</a>
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
                <!-- Pagination -->
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-end">
                        <li class="page-item disabled">
                            <span class="page-link">Previous</span>
                        </li>
                        <li class="page-item active" aria-current="page">
                            <span class="page-link">1</span>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
