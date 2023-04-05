

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
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
        
        <!--CSS LINKS-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="shortcut icon" href="./images/facebook-logo-2019.png" type="image/x-icon">

        <!-- =============== CSS LINK ============= -->
        <link rel="stylesheet" href="./css/style.css">

        <!-- =========== BOX ICON =============== -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        
        
    </head>
    <body>
        
        <nav>
        <div class="navigation container">
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
                <div class="left_icon">
                    <i class='bx bxl-messenger'></i>
                </div>
                <div class="left_icon bell_icon">
                    <i class='bx bxs-bell'></i>
                </div>
                    <a href="LogoutServlet" style="height: 100%; display: flex; align-items: center; justify-content: center;">
                    <div class="left_icon">
                        <i class='bx bx-log-out'></i>
                    </div>
                    <p>Logout</p>
                </a>
            </div>
        </div>
    </nav>

    <!-- =======XXXX=========== NAVIGATION ENDS HERE =======XXXX====== -->

    <!-- ========= MAIN ============== -->
    <main>
        <section class="container main_section">
            <div class="left_sidebar">
                <div class="upper_sec">
                    <a href="UserProfile.jsp">
                        <div class="left_profile">
                            <img src="pics/<%= user.getProfile() %>" alt="">
                            <p><%= user.getUsername() %></p>
                        </div>
                    </a>
                    <div class="main_icon">
                        <i class='bx bxs-group'></i>
                        <p>Friends</p>
                    </div>
                    <div class="main_icon">
                        <i class='bx bxs-flag-alt'></i>
                        <p>Pages</p>
                    </div>
                    <div class="main_icon">
                        <i class='bx bxs-group'></i>
                        <p>Groups</p>
                    </div>
                    <div class="main_icon">
                        <i class='bx bxs-store'></i>
                        <p>Marketplace</p>
                    </div>
                    <div class="main_icon">
                        <i class='bx bxs-videos'></i>
                        <p>Watch</p>
                    </div>
                    <div class="main_icon">
                        <div class="down_arrow">
                            <i class='bx bxs-chevron-down'></i>
                        </div>
                        <p>See more</p>
                    </div>
                </div>
                <hr>
                <div class="down_sec">
                    <h3>Your shortcuts</h3>
                    <div class="shortcut">
                        <img src="images/tech1.jpg" alt="shortcut">
                        <p>New Technology</p>
                    </div>
                    <div class="shortcut">
                        <img src="images/tech2.jpg" alt="shortcut">
                        <p>Data Science</p>
                    </div>
                    <div class="shortcut">
                        <img src="images/tech1.jpg" alt="shortcut">
                        <p>Machine Learning</p>
                    </div>
                </div>
            </div>

            <div class="mid_section">
                <div class="stories">
                    <div class="story my_story">
                        <i class='bx bxs-plus-circle'></i>
                        <p>Create Story</p>
                    </div>
                    <div class="story story1">
                        <img src="images/menProfile1.jpg" alt="">
                        <p>Code Smashers</p>
                    </div>
                    <div class="story story2">
                        <img src="images/girlProfile1.jpg" alt="">
                        <p>Kylie Jenner</p>
                    </div>
                    <div class="story story3">
                        <img src="images/menProfile2.jpg" alt="">
                        <p>John Worth</p>
                    </div>
                    <div class="story story4">
                        <img src="images/girlProfile2.jpg" alt="">
                        <p>Selena Gomez</p>
                    </div>
                </div>

                <div class="activity_sec">
                    <div class="act_profile">
                        <img src="pics/<%= user.getProfile() %>" alt="">
                        <div class="question">
                            <input type="text" placeholder="Whts in your mind?" style="background: none; outline: none; border: none;"/>
                        </div>
                    </div>
                    <hr>
                    <div class="activity">
                        <div class="live act_icon">
                            <i class='bx bxs-video-plus'></i>
                            <p>Live video</p>
                        </div>
                        <a href="#" class="live act_icon" data-bs-toggle="modal" data-bs-target="#postModal">
                            <i class='bx bxs-photo-album'></i>
                            <p>Photo/Video</p>
                        </a>
                        <div class="live act_icon">
                            <i class='bx bx-smile'></i>
                            <p>Feeling/Activity</p>
                        </div>
                    </div>
                </div>
                
                <!--MODAL WINDOW FOR POST-->

                <div class="modal fade" id="postModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">New Post</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                          <form id="addPostForm" action="AddPostServlet" method="post">
                              <select class="form-control mb-2" name="categoryId">
                                  <option selected disabled>---Select Category---</option>
                                  
                                  <%
                                    PostDao pdao = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = pdao.getAllCategories();
                                      
                                    for(Category c : list) {
                                  %>
                                  <option value="<%= c.getCid() %>"><%= c.getCname() %></option>
                                  <%
                                    }
                                  %>
                              </select>
                              <div class="form-group">
                                  <textarea name="pdescription" class="form-control mb-2" placeholder="Add Description" style="height: 250px;"></textarea>
                              </div>
                              <div class="form-group">
                                  <label style="margin-bottom: 5px;">Select Photo</label>
                                  <input name="pimage" type="file" class="form-control" />
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
                
                <!--END OF MODAL WINDOW-->

                <div class="room">
                    <div class="room_icon">
                        <i class='bx bxs-video-plus'></i>
                        <p>Create Room</p>
                    </div>
                    <div class="room_profiles">
                        <div class="profile_active">
                            <img src="images/girlProfile1.jpg" alt="">
                        </div>
                        <div class="profile_active">
                            <img src="images/menProfile1.jpg" alt="">
                        </div>
                        <div class="profile_active">
                            <img src="images/girlProfile2.jpg" alt="">
                        </div>
                        <div class="profile_active">
                            <img src="images/menProfile2.jpg" alt="">
                        </div>
                        <div class="profile_active">
                            <img src="images/myprofile.jpg" alt="">
                        </div>
                        <div class="profile_active">
                            <img src="images/girl2.jpg" alt="">
                        </div>
                        <div class="profile_active">
                            <img src="images/men1.jpg" alt="">
                        </div>
                    </div>
                </div>

                <!-- ========POST============= -->
                <div class="posts" id="new_post">
                    
                </div>
                <div class="lode_more">
                    <a href="#">Lode more . . .</a>
                </div>
            </div>

            <div class="right_sidbar">
                <div class="add_sec">
                    <h3 class="sponsored">Sponsored</h3>
                    <div class="add1 add">
                        <div class="image">
                            <img src="images/project.jpg" alt="add1">
                        </div>
                        <div class="proj_details">
                            <p>Hands-on projects. Classroom experience.Dedicaed....</p>
                            <a href="#">practice.codesmashers.org</a>
                        </div>
                    </div>
                    <div class="add2 add">
                        <div class="image">
                            <img src="images/foundation.jpg" alt="add1">
                        </div>
                        <div class="proj_details">
                            <p>Foundation & Year One</p>
                            <a href="#">www.ourcollege.uk/the-college/</a>
                        </div>
                    </div>
                </div>

                <hr>

                <div class="page_sec">
                    <div class="page_head">
                        <h3>Your Pages</h3>
                        <i class='bx bx-dots-horizontal-rounded dots'></i>
                    </div>
                    <div class="page_profile">
                        <img src="images/DarkMode.png" alt="profile">
                        <h3 class="page_title">Dark Mode</h3>
                    </div>
                    <div class="page_profile">
                        <i class='bx bxs-bell'></i>
                        <p>15 Notifications</p>
                    </div>
                    <div class="page_profile">
                        <i class='bx bxs-megaphone'></i>
                        <p>Create Promotion</p>
                    </div>
                </div>

                <hr>

                <div class="active_user_sec">
                    <div class="active_head">
                        <div class="contact">
                            <h3>Contacts</h3>
                            <div class="active_icons">
                                <i class='bx bxs-video-plus'></i>
                                <i class='bx bx-search'></i>
                                <i class='bx bx-dots-horizontal-rounded dots'></i>
                            </div>
                        </div>
                    </div>
                    <div class="right_sec_profiles">
                        <div class="active_use">
                            <div class="profile_active">
                                <img src="images/girlProfile2.jpg" alt="">
                            </div>
                            <p>Alexa</p>
                        </div>
                        <div class="active_use">
                            <div class="profile_active">
                                <img src="images/menProfile1.jpg" alt="">
                            </div>
                            <p>Harry Style</p>
                        </div>
                        <div class="active_use">
                            <div class="profile_active">
                                <img src="images/menProfile2.jpg" alt="">
                            </div>
                            <p>Ankit Saud</p>
                        </div>
                        <div class="active_use">
                            <div class="profile_active">
                                <img src="images/menProfile1.jpg" alt="">
                            </div>
                            <p>Harry Style</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
        
        
                <!--BOOTSTRAP JS LINK-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        
        <!--JQUERY LINK-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
       
        <!--SWEET ALERT-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        <!--JS FILE-->
        <script src="js/index.js" type="text/javascript"></script>
        
        
        <!--ADDING POST-->
        <script>
            $(document).ready(function (e) {
                $('#addPostForm').on("submit", function (event) {
                    event.preventDefault();
                    
                    let form = new FormData(this);
                    
                    //Requesting data using ajax
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if(data.trim()=="Success") {
                                swal("Posted Successfully")
                                        .then((value)=> {
                                            window.location=("Profile.jsp");
                                });
                            } else {
                                swal(data)
                            }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("You got some error, Please try again!");
                    },
                    processData: false,
                    contentType: false
                    });
                });
            })
        </script>
        
        <script>
            $(document).ready(function () {
                $.ajax({
                    url: "DisplayPost.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $('#new_post').html(data);
                    }
                })
            })
        </script>
        
    </body>
</html>
