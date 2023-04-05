
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!--BOOTSTRAP CSS LINK-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <!--NAVBAR-->
        
        
        <nav class="navbar navbar-expand-lg bg-body-tertiary navbar-dark primary-backgroud">
          <div class="container-fluid">
              <a class="navbar-brand" href="index.jsp"><span class="fa fa-check-square-o"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-home"></span> Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Course
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Core Java</a></li>
                    <li><a class="dropdown-item" href="#">SQL Programming</a></li>
                    <li><a class="dropdown-item" href="#">Python</a></li>
                    <li><a class="dropdown-item" href="#">AWS full Course</a></li>
                  </ul>
                </li>
                <li class="nav-item">
                    <a href="login.jsp" class="nav-link">Login</a>
                </li>
              </ul>
              <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-secondary" type="submit">Search</button>
              </form>
            </div>
          </div>
        </nav>
        <!--END OF NAVBAR-->
        
        <main class="d-flex align-items-center" style="height:92.5vh; background: #b39ddb;">
            <div class="container">
                <div class="card col-md-4 offset-md-4">
                    <div class="card-header text-white" style="background: #0d6efd;">
                        <h3>Login Here</h3>
                    </div>
                    <div class="card-body">
                        <form id="reg_form" action="RegisterServlet" method="POST">
                          <div class="mb-3">
                            <label for="user_name" class="form-label">Full Name</label>
                            <input name="user_name" required type="text" class="form-control" id="user_name" placeholder="user name">
                          </div>
                            
                          <div class="mb-3">
                            <label for="user_contact" class="form-label">Phone Number</label>
                            <input name="user_contact" required type="number" class="form-control" id="user_contact" placeholder="contact">
                          </div>
                            
                          <div class="mb-3">
                            <label for="exampleInputEmail" class="form-label">Email</label>
                            <input name="user_email" required type="email" class="form-control" id="exampleInputEmail" placeholder="user email">
                          </div>
                            
                            <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input name="user_password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="password">
                          </div>
                            
                          <div class="mb-3">
                            <label for="exampleInputPassword2" class="form-label">Conform Password</label>
                            <input name="conf_pass" required type="password" class="form-control" id="exampleInputPassword2" placeholder="re-enter password">
                          </div>
                            
                          <div class="form-check">
                              <input name="cond_check" type="checkbox" class="form-check-input" id="exampleCheck">
                            <label for="exampleCheck" class="form-check-label">Agree terms and conditions</label>
                          </div>
                            
                            <button type="submit" class="btn btn-primary" style="margin-top: 10px">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        
        
        <!--BOOTSTRAP JS LINK-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        
        <!--JQUERY LINK-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
       
        <!--JS FILE-->
        <script src="js/index.js" type="text/javascript"></script>
        
        <!--SWEET ALERT-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        <script>
            $(document).ready(function () {
                console.log("Loaded...");
                $("#reg_form").on("submit", function (event) {
                    event.preventDefault();
                    
                    let form = new FormData(this);
                    
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        
                        success: function (data, textStatus, jqXHR) {
                            
                            if(data.trim()=="Data Inserted Successfully") {
                                swal("Register Successfully")
                                .then((value) => {
                                  window.location="login.jsp";
                                });
                            } else {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Please check the details")
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
    </body>
</html>
