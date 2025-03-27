<%@page import="com.blog.entity.Blogger"%>
<%@page import="com.blog.dao.BloggerDao"%>
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
        
         .table td img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
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
        BloggerDao bloggerDao=new BloggerDao(FactoryProduct.getFactory());
        List<Blogger> bloggerList=bloggerDao.getAllBlogger();
    %>
    <div class="content">
        <div class="header-section">
                                <img src="../img/digiRachna-removebg-preview.png" alt="Logo 2" class="content-logo">
            <h1>Manage Posts</h1>
            <p class="subtitle">View, edit, and manage your blog posts.</p>
           
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
                                <th>Name <i class="fas fa-sort sort-icon"></i></th>
<!--                                <th>Author <i class="fas fa-sort sort-icon"></i></th>-->
                                <th>Email <i class="fas fa-sort sort-icon"></i></th>
                                <th>Contact</th>
                                <th>Status <i class="fas fa-sort sort-icon"></i></th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(Blogger b:bloggerList){
                            %>
                            <tr>
                                <td><img src="../img/bloggerPhoto/<%= b.getPhoto() %>" alt="profile pic"></td>
                                <td><%= b.getName() %></td>
                                <td><%= b.getEmail() %></td>
                                <td><%= b.getContact() %></td>
                               
                                <%
                                    if(b.getStatus().equals("Allow")){
                                %>
                                <td><span class="badge bg-success">Allowed</span></td>
                                <%
                                    }else{
                                %>
                                <td><span class="badge bg-warning">Not Allowed</span></td>
                                <%
                                    }
                                %>
                                <td>
                                    <a href="#" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#viewUserModal<%= b.getId() %>">View</a>
                                    <a href="#" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editUserModal<%= b.getId() %>">Edit</a>
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
                            
   
<!-- View User Modal -->
 <%
        for(Blogger b:bloggerList){
    %>

<div class="modal fade" id="viewUserModal<%= b.getId() %>" tabindex="-1" aria-labelledby="viewUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="viewUserModalLabel">View User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                 <!-- Profile Picture -->
                <img src="../img/bloggerPhoto/<%= b.getPhoto() %>" alt="profile pic" class="rounded-circle mb-3" style="width: 100px; height: 100px;">
                
                <!-- View User Details -->
                <p><strong>Username:</strong> <%= b.getName() %></p>
                <p><strong>Email:</strong> <%= b.getEmail() %></p>
                <p><strong>Registration date</strong> <%= b.getRegistrationDate() %></p>
                <p><strong>Status:</strong> <%= b.getStatus() %></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

    <%
        }
    %>
    
    
  <!-- Edit User Modal -->
     <%
        for(Blogger b:bloggerList){
    %>
<div class="modal fade" id="editUserModal<%= b.getId() %>" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="../ChangeServlet" method="post">
            <input value="<%= b.getId() %>" name="bloggerId" hidden>
            <input value="status" name="action" hidden >
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
              <div class="modal-body text-center">
                    <!-- Profile Picture -->
                    <img src="../img/bloggerPhoto/<%= b.getPhoto() %>" alt="profile pic" class="rounded-circle mb-3" style="width: 100px; height: 100px;">

                <!-- Edit User Form -->
             
                    <div class="mb-3">
                        <label for="edit-username" class="form-label">Username</label>
                        <input type="text" readonly class="form-control" id="edit-username" value="<%= b.getName() %>">
                    </div>
                    <div class="mb-3">
                        <label for="edit-email" class="form-label">Email address</label>
                        <input type="email" readonly class="form-control" id="edit-email" value="<%= b.getEmail() %>">
                    </div>
                    <div class="mb-3">
                        <label for="edit-status" class="form-label">Change Status</label>
                        <select name="status" class="form-select" id="edit-status">
                            <option value="<%= b.getStatus() %>" selected><%= b.getStatus() %></option>
                            <option value="Allow">Allow</option>
                            <option value="Not Allow">Not Allowed</option>
                        </select>
                    </div>
                  
               
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
        </div>
    </form>
    </div>
</div>
<%
    }
%>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
