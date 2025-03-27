<%@page import="com.blog.entity.Comments"%>
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
    <%
     CommentsDao commentDao=new CommentsDao(FactoryProduct.getFactory());
     List<Comments> commentList=commentDao.getAllComments();
    %>
   <%@include file="components/navbar.jsp" %>
    <div class="content">
        <div class="header-section">
                                <img src="../img/digiRachna-removebg-preview.png" alt="Logo 2" class="content-logo">
            <h1>Manage Comments</h1>
            <p class="subtitle">View, edit, and manage comments on your blog posts.</p>
           
        </div>
        <div class="card">
            <div class="card-body">
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Search comments..." aria-label="Search comments">
                </div>
                  <div class="table-responsive">
                    <table class="table table-hover">
                        <thead class="thead-light">
                            <tr>
                                <th>#</th>
                                <th>Blog</th>
                                <th>Comment <i class="fas fa-sort sort-icon"></i></th>
                                <th>User Name <i class="fas fa-sort sort-icon"></i></th>
                                <th>User Email <i class="fas fa-sort sort-icon"></i></th>
                                <th>Date <i class="fas fa-sort sort-icon"></i></th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                              int sr=1;
                                if(commentList!=null){
                                for(Comments c:commentList){
                            %>
                            <tr>
                                <td><%= sr %></td>
                                <td><%= c.getBlog().getTitle() %></td>
                                <td><%= c.getComment() %></td>
                                <td><%= c.getUserName() %></td>
                                <td><%= c.getUserEmail() %></td>
                                <td><%= c.getCommentDate() %><td>
                                
                                     <form action="../CommentServlet" method="post">
                                        <input type="text" hidden name="type" value="delete" >
                                        <input type="text" hidden name="blogId" value="<%= c.getBlog().getId() %>" >
                                        <input type="text" hidden name="commentId" value="<%= c.getId() %>" >
                                        <input type="text" hidden name="user" value="admin">

                                    <button type="submit" class="btn btn-danger btn-action">Delete</button>
                                     </form>
                              
                            </tr>
                            <%
                                sr=sr+1;
                                }
                            }
                            %>
                          
                        </tbody>
                    </table>
                </div>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
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
