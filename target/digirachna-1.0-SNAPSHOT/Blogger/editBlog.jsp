<%@page import="com.blog.entity.Blog"%>
<%@page import="com.blog.entity.Comments"%>
<%@page import="com.blog.dao.BlogDao"%>
<%@page import="com.helper.FactoryProduct"%>
<%@page import="java.util.List"%>

<%@include file="components/header.jsp" %>
<style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4f6f9;
    }

    h2 {
      font-weight: bold;
    }

    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }

    .editor-container {
      background-color: #ffffff;
      border-radius: 5px;
      padding: 20px;
      transition: all 0.3s ease;
    }

    .editor-container:hover {
      box-shadow: 0px 4px 12px rgba(0, 123, 255, 0.1);
    }

    textarea {
      border: none;
      resize: none;
      height: 60vh; /* Larger height for the blog writing */
      width: 100%;
      font-size: 16px;
      line-height: 1.5;
      padding: 10px;
    }

    .toolbar button {
      margin-right: 5px;
    }

    .toolbar button:hover {
      background-color: #007bff;
      color: #ffffff;
      transition: all 0.2s ease-in-out;
    }

    @media (max-width: 768px) {
      .editor-container {
        padding: 1rem;
      }

      .toolbar {
        justify-content: center;
      }
    }
  </style>
</head>
<body>
 <%
     int blogId=Integer.parseInt(request.getParameter("blogId"));
     BlogDao blogDao=new BlogDao(FactoryProduct.getFactory());
     Blog blog=blogDao.getBlogByBlogId(blogId); 
 %>
<div class="container-fluid py-4 px-4 bg-light">
    <form action="../BlogPostServlet" method="post">
        <input type="text" hidden name="action" value="edit"> 
        <input type="text" hidden name="blogId" value="<%= blogId %>"> 
        <input type="text" hidden name="bloggerId" value="<%= blogger.getId() %>">
        <input type="text" hidden name="user" value="blogger">

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h2 class="text-primary">Edit your Blog Post</h2>
   </div>
  
    <!-- Post Title -->
    <div class="mb-3">
      <input type="text" name="title" class="form-control form-control-lg shadow-sm" value="<%= blog.getTitle() %>">
    </div>
  
    <!-- Text Editor -->
    <div class="editor-container shadow-sm">
      <div class="toolbar mb-2">
        <a class="btn btn-outline-primary btn-sm"><i class="fas fa-bold"></i></a>
        <a class="btn btn-outline-primary btn-sm"><i class="fas fa-italic"></i></a>
        <a class="btn btn-outline-primary btn-sm"><i class="fas fa-underline"></i></a>
        <a class="btn btn-outline-primary btn-sm"><i class="fas fa-list-ul"></i></a>
        <a class="btn btn-outline-primary btn-sm"><i class="fas fa-list-ol"></i></a>
        <a class="btn btn-outline-primary btn-sm"><i class="fas fa-link"></i></a>
        <a class="btn btn-outline-primary btn-sm"><i class="fas fa-image"></i></a>
      </div>
      <textarea name="content" class="form-control shadow-sm" rows="15" ><%= blog.getContent() %></textarea>
    </div>
  
    <!-- Post Options -->
    <div class="row mt-4">
      <div class="col-md-6 mb-3">
        <select name="category" class="form-select shadow-sm">
            <option value="<%= blog.getCategory() %>" selected><%= blog.getCategory() %></option>
          <option value="Technology">Technology</option>
          <option value="Lifestyle">Lifestyle</option>
          <option value="Business">Business</option>
        </select>
      </div>
    
        <div class="col-md-6 mb-3">
        <select name="status" class="form-select shadow-sm">
            <option value="<%= blog.getStatus() %>" selected><%= blog.getStatus() %></option>
          <option value="Published">Publish</option>
          <option value="Draft">Save as Draft</option>
        </select>
      </div>
        
         <div class="col-md-6 mb-3">
     <button type="submit" class="btn btn-primary shadow-sm">Submit</button>
    </div>
    </div> 
    </form>
          <form action="../BlogPostServlet" method="post" enctype="multipart/form-data">
             
              <input type="text" hidden name="action" value="thumbnail"> 
              <input type="text" hidden name="blogId" value="<%= blogId %>"> 
              
           <div class="col-md-6 mb-3">
               <a href="../img/thumbnail/<%= blog.getThumbnail() %>" target="_blank">Selected thumbnail</a>
          <label>Change thumbnail</label>
          <input name="thumbnail" type="file" required class="form-control shadow-sm" id="coverImage" accept="image/*">
      </div>
          <button type="submit" class="btn btn-primary shadow-sm">Submit</button>
   
          </form>
  </div>
          
            <div class="content">
        <div class="header-section">
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
                                <th>Comment <i class="fas fa-sort sort-icon"></i></th>
                                <th>User Name <i class="fas fa-sort sort-icon"></i></th>
                                <th>User Email <i class="fas fa-sort sort-icon"></i></th>
                                <th>Date <i class="fas fa-sort sort-icon"></i></th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Comments> commentList=blog.getComments();
                                int sr=1;
                                if(commentList!=null){
                                for(Comments c:commentList){
                            %>
                            <tr>
                                <td><%= sr %></td>
                                <td><%= c.getComment() %></td>
                                <td><%= c.getUserName() %></td>
                                <td><%= c.getUserEmail() %></td>
                                <td><%= c.getCommentDate() %><td>
                                
                                     <form action="../CommentServlet" method="post">
                                        <input type="text" hidden name="type" value="delete" >
                                        <input type="text" hidden name="blogId" value="<%= blogId %>" >
                                        <input type="text" hidden name="commentId" value="<%= c.getId() %>" >
                                         <input type="text" hidden name="user" value="blogger">

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
  
  <!-- Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <!-- Custom JS -->
 
</body>
</html>
