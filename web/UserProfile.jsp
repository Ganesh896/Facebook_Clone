
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error.jsp" %>
<% 
    User user = (User)session.getAttribute("currentUser");
    
    if(user==null) {
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <!-- =========== CSS LINK ============== -->
        <link rel="stylesheet" href="./css/profile.css">

        <!-- =========== BOX ICON =============== -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        
        <style>
            .cover_sec .cover_pic {
            position: relative;
            background: url(coverPhotos/<%= user.getCover() %>);
            background-position: center;
            background-size: cover;
            height: 350px;
            border-radius: 0 0 10px 10px;
            cursor: pointer;
          }
        </style>
        
    </head>
    <body>
        <nav>
        <div class="navigation nav_container">
            <div class="nav_left">
                <a href="Profile.jsp">
                    <img src="images/facebook-logo-2019.png" alt="">
                </a>
                <div class="search">
                    <i class='bx bx-search'></i>
                    <input type="search" name="search" placeholder="Search Facebook">
                </div>
            </div>
            <div class="nav_mid">
                <div class="mid_icon home">
                    <i class='bx bxs-home'></i>
                </div>
                <div class="page mid_icon">
                    <i class='bx bx-flag'></i>
                </div>
                <div class="video mid_icon">
                    <i class='bx bx-movie-play'></i>
                </div>
                <div class="mid_icon">
                    <i class='bx bx-store-alt'></i>
                </div>
                <div class="mid_icon">
                    <i class='bx bx-group'></i>
                </div>
            </div>
            <div class="nav_right">
                <a href="UserProfile.jsp">
                    <div class="profile">
                        <img src="pics/<%= user.getProfile() %>" alt="">
                        <p><%= user.getUsername() %></p>
                    </div>
                </a>
                <!--<div class="left_icon">-->
                <div class="dropdown">
                    <div class="left_icon" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class='bx bxs-grid'></i>
                    </div>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="DeleteUserServlet" id="deleteAccount">Delete your account</a></li>
                    </ul>
                </div>
                <div class="left_icon bell_icon">
                    <i class='bx bxs-bell'></i>
                </div>
                    <a href="LogoutServlet" style="display: flex;">
                        <div class="left_icon">
                            <i class='bx bx-log-out'></i>
                        </div>
                        <p>Logout</p>
                    </a>
                </div>
            </div>
        </nav>
                    
                    <% 
                                Message message = (Message)session.getAttribute("message");
                                
                                if(message!=null) {
                            %>
                                    
                            <div class="alert <%=message.getCssClass() %>" role="alert">
                                        <%= message.getMessage() %>
                                    </div>

                            <%
                                    session.removeAttribute("message");
                                }
                            %>

        <section class="container">
            <div class="top_section">
                <div class="cover_sec">
                    <div class="cover_pic">
                        <div class="edit_cover" data-bs-toggle="modal" data-bs-target="#coverModel">
                            <i class='bx bxs-camera'></i>
                            <p>Edit Cover Photo</p>
                        </div>
                        
                        
                                                <!--MODEL WINDOW TO CHANGE PROFILE PICTURE-->
                        
                        <div class="modal fade" id="coverModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h1 class="modal-title fs-5" id="exampleModalLabel">Change Cover Photo</h1>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="EditCoverPhoto" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <input name="cover_photo" type="file" class="form-control" />
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                          <button type="submit" class="btn btn-primary">Post</button>
                                        </div>
                                    </form>
                                </div>
                              </div>
                            </div>
                        </div>
                        <!--====END OF MODEL WINDOW=====-->
                        
                    </div>
                    <div class="profile_details">
                        <div class="profile_pic">
                            <img src="pics/<%= user.getProfile() %>" alt="Profile">
                        </div>
                        <div class="change_pp" id="editProfile" data-bs-toggle="modal" data-bs-target="#profileModel">
                            <i class='bx bxs-camera'></i>
                        </div>
                        
                        
                        
                        <!--MODEL WINDOW TO CHANGE PROFILE PICTURE-->
                        
                        <div class="modal fade" id="profileModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h1 class="modal-title fs-5" id="exampleModalLabel">Change Profile Picture</h1>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="EditProfileImage" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <input name="new_profile" type="file" class="form-control" />
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                          <button type="submit" class="btn btn-primary">Post</button>
                                        </div>
                                    </form>
                                </div>
                              </div>
                            </div>
                        </div>
                        <!--====END OF MODEL WINDOW=====-->
                        
                        
                        <div class="name_bio">
                            <h1><%= user.getUsername() %></h1>
                            <a href="#">Add Bio</a>
                        </div>
                    </div>
                </div>
                <hr>

                <div class="top_down flex">
                    <ul class="flex">
                        <li><a href="#">Posts</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Friends</a></li>
                        <li><a href="#">Photos</a></li>
                        <li><a href="#">Story Archive</a></li>
                        <li><a href="#" class="more">More <i class='bx bxs-down-arrow'></i></a></li>
                    </ul>
                    <div class="top_icon flex">
                        <button type="button" class="edit_profile" id="edit_profile_btn">
                            <i class='bx bxs-pencil'></i>
                            <p>Edit Profile</p>
                        </button>>
                        <div class="edit_profile">
                            <i class='bx bxs-video-plus'></i>
                        </div>
                        <div class="edit_profile">
                            <i class='bx bx-search'></i>
                        </div>
                        <div class="edit_profile">
                            <i class='bx bx-dots-horizontal-rounded'></i>
                        </div>
                    </div>
                </div>
            </div>
                            
            <div id="profile_details">            
                <table>
                    <tbody>
                        <tr>
                            <th colspan="5">ID</th>
                            <td><%= user.getId() %></td>
                        </tr>
                        <tr>
                            <th colspan="5">Username</th>
                            <td><%= user.getUsername() %></td>
                        </tr>
                        <tr>
                            <th colspan="5">Phone</th>
                            <td><%= user.getPhone() %></td>
                        </tr>
                        <tr>
                            <th colspan="5">Email</th>
                            <td><%= user.getEmail()%></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="edit_profile_details" style="display: none;">
                <h3>Edit your details</h3>
                <form action="EditProfileServlet" method="post">
                    <table>
                        <tr>
                            <th colspan="5">ID</th>
                            <td><%= user.getId() %></td>
                        </tr>
                        <tr>
                            <th colspan="5">Username</th>
                            <td><input type="text" name="user_name" class="form-control" value="<%= user.getUsername()%>" /></td>
                        </tr>
                        <tr>
                            <th colspan="5">Phone</th>
                            <td><input type="number" name="user_phone" class="form-control" value="<%= user.getPhone()%>" /></td>
                        </tr>
                        <tr>
                            <th colspan="5">Email</th>
                            <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail()%>" /></td>
                        </tr>
<!--                        <tr>
                            <th colspan="5">New Profile Picture</th>
                            <td><input type="file" name="new_profile" class="form-control" /></td>
                        </tr>-->
                    </table>
                        <div style="float: right; margin: 15px;">
                            <a href="UserProfile.jsp" class="btn btn-outline-primary me-2">Cancel</a>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                </form>
            </div>
                        
                        <div class="container" id="user_posts">
                            
                        </div>
        </section>
                
        <!--BOOTSTRAP JS LINK-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        
        <!--JQUERY LINK-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
       
        <script src="js/index.js" type="text/javascript"></script>
        
        <!--SWEET ALERT-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        <script>
            
            $(document).ready(function () {
                let edit_status = false;
                $('#edit_profile_btn').click(function () {
                    if(!edit_status) {
                        $('#profile_details').hide();
                        $('#edit_profile_details').show();
                        edit_status=true;
                    } else {
                        $('#profile_details').show();
                        $('#edit_profile_details').hide();
                        edit_status = false;
                    }
                })
            })
            
        </script>
        
        <script>
            $(document).ready(function () {

                $("#deleteAccount").click(function (event) {
                    event.preventDefault();
       
                    $.ajax({
                        url: "DeleteUserServlet",
                        type: 'POST',
                        
                        success: function (data, textStatus, jqXHR) {
                            if(data.trim()=="Deleted") {
                                swal("Account Deleted Successfully!")
                                .then((value) => {
                                  window.location="login.jsp";
                                });
                            } else {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Some Error Occured!")
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
        
        <script>
            $(document).ready(function () {
                $.ajax({
                    url: "DisplayUserPost.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $('#user_posts').html(data);
                    }
                })
            })
        </script>
        
        
    </body>
</html>
