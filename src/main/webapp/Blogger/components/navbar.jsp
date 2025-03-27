  <div class="sidebar">
      <img src="../img/logo3.jpg" alt="Logo 1" class="sidebar-logo">
        <div class="profile">
            <img src="../img/bloggerPhoto/<%= blogger.getPhoto() %>" alt="Profile Picture">
            <h4><%= blogger.getName() %></h4>
            <div class="dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                    Profile
                </a>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#settingsModal">Settings</a></li>
<!--                    <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#profileModal">Profile</a></li>-->
                    <li><a class="dropdown-item" href="myProfile.jsp" >My Profile</a></li>
                </ul>
            </div>
        </div>
        <a class="nav-link" href="dashboard.jsp">Dashboard</a>
        <a class="nav-link" href="posts.jsp">Posts</a>
        <a class="nav-link" href="comments.jsp">Comments</a>
        <a class="nav-link" href="statistics.jsp">Statistics</a>
        <a class="nav-link" href="../LogoutServlet">Logout</a>
        
    </div>

<!-- Profile Modal -->
<!--<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="profileModalLabel">Profile</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                     Profile Picture 
                    <div class="mb-3 text-center">
                        <label for="profilePicture" class="form-label">Profile Picture</label>
                        <div class="mb-2">
                            <img src="https://via.placeholder.com/100" class="rounded-circle" alt="Profile Picture">
                        </div>
                        <input class="form-control" type="file" id="profilePicture">
                    </div>

                     Name 
                    <div class="mb-3">
                        <label for="profileName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="profileName" value="Rohan">
                    </div>

                     Email 
                    <div class="mb-3">
                        <label for="profileEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="profileEmail" value="rohan@example.com">
                    </div>

                     Bio 
                    <div class="mb-3">
                        <label for="profileBio" class="form-label">Bio</label>
                        <textarea class="form-control" id="profileBio" rows="3" placeholder="Tell something about yourself...">Java Developer with a passion for coding and design.</textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>-->

<!-- Settings Modal -->
<div class="modal fade" id="settingsModal" tabindex="-1" aria-labelledby="settingsModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="settingsModalLabel">Settings</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Change Password Form -->
                <form action="../ChangeServlet" method="post">
                    <input type="text" hidden name="action" value="password">
                    <input type="text" hidden name="bloggerId" value="<%= blogger.getId() %>">
                    <input type="text" hidden name="user" value="blogger" > 

                    
                    <!-- Current Password -->
                    <div class="mb-3">
                        <label for="currentPassword" class="form-label">Current Password</label>
                        <input required type="password" onchange="return currentPasswordCheck()" class="form-control" id="currentPassword" placeholder="Enter current password">
                        <p id="message"></p>
                    </div>
                    <!-- New Password -->
                    <div class="mb-3">
                        <label for="newPassword" class="form-label">New Password</label>
                        <input required type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Enter new password">
                    </div>
                    <!-- Confirm New Password -->
                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label">Confirm New Password</label>
                        <input required type="password" onchange="return confirmPasswordCheck()" class="form-control" id="confirmPassword" placeholder="Confirm new password">
                        <p id="confirmMessage"></p>
                    </div>
                    
                    <!-- Change Password Submit -->
                    <button type="submit" id="savePasswordButton" class="btn btn-primary">Change Password</button>
                </form>
                
                <!-- Change Photo Form -->
                <form action="../ChangeServlet" method="post" enctype="multipart/form-data">
                     <input type="text" hidden name="action" value="photo">
                    <input type="text" hidden name="bloggerId" value="<%= blogger.getId() %>">
                    <input type="text" hidden name="user" value="blogger" > 

                    
                    <!-- Change Photo -->
                    <div class="mb-3">
                         <label for="changePhoto" class="form-label">Change Photo</label>
                         <input type="file" required class="form-control" id="changePhoto" name="photo" accept="image/*">
                    </div>
                    <!-- Change Photo Submit -->
                    <button type="submit" id="savePhotoButton" class="btn btn-primary">Change Photo</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


                    <!-- Notifications -->
<!--                    <div class="mb-3">
                        <label class="form-label">Notifications</label>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="emailNotifications" checked>
                            <label class="form-check-label" for="emailNotifications">Email Notifications</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="smsNotifications">
                            <label class="form-check-label" for="smsNotifications">SMS Notifications</label>
                        </div>
                    </div>-->

                    <!-- Theme Selection -->
<!--                    <div class="mb-3">
                        <label for="themeSelect" class="form-label">Theme</label>
                        <select class="form-select" id="themeSelect">
                            <option selected>Light</option>
                            <option>Dark</option>
                            <option>Auto</option>
                        </select>
                    </div>-->