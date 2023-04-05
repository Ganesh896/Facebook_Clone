
<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
        <!--CSS LINKS-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <!--NAVBAR-->
        <%@include file="bootstrapnavbar.jsp" %>
        
        <main class="d-flex align-items-center" style="height:100vh; background: #b39ddb;">
            <div class="container">
                <div class="card col-md-4 offset-md-4">
                    <div class="card-header text-white" style="background: #0d6efd;">
                        <h3>Login Here</h3>
                    </div>
                    <div class="card-body">
                        <form action="LoginServlet" method="post">
                          <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <input type="email" name="loginEmail" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                          </div>
                          <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input type="password" name="loginPass" required class="form-control" id="exampleInputPassword1">
                          </div>
                            
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
                            
                          <button type="submit" class="btn btn-primary">Submit</button>
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
    </body>
</html>
