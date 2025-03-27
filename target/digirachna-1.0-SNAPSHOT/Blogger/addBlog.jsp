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
 
<div class="container-fluid py-4 px-4 bg-light">
    <form action="../BlogPostServlet" method="post" enctype="multipart/form-data">
        <input type="text" hidden name="bloggerId" value="<%= blogger.getId() %>">
        
        <input type="text" hidden name="action" value="add"> 
    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h2 class="text-primary">Write a New Post</h2>
   </div>
  
    <!-- Post Title -->
    <div class="mb-3">
      <input type="text" name="title" class="form-control form-control-lg shadow-sm" placeholder="Post Title">
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
      <textarea name="content" class="form-control shadow-sm" rows="15" placeholder="Write your post here..."></textarea>
    </div>
  
    <!-- Post Options -->
    <div class="row mt-4">
      <div class="col-md-6 mb-3">
        <select name="category" class="form-select shadow-sm">
          <option selected>Choose Category</option>
          <option value="Technology">Technology</option>
          <option value="Lifestyle">Lifestyle</option>
          <option value="Business">Business</option>
        </select>
      </div>
    
        <div class="col-md-6 mb-3">
        <select name="status" class="form-select shadow-sm">
          <option selected>Choose Status</option>
          <option value="Published">Publish</option>
          <option value="Draft">Save as Draft</option>
        </select>
      </div>
        
      <div class="col-md-6 mb-3">
        <input name="thumbnail" type="file" class="form-control shadow-sm" id="coverImage" accept="image/*">
      </div>
        
         <div class="col-md-6 mb-3">
     <button type="submit" class="btn btn-primary shadow-sm">Submit</button>
    </div>
    </div>
    
       
    </form>
  </div>
  
  <!-- Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <!-- Custom JS -->
 
</body>
</html>
