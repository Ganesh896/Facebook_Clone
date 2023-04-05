
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%
    PostDao pd = new PostDao(ConnectionProvider.getConnection());
    
    UserDao ud = new UserDao(ConnectionProvider.getConnection());
    User currentUser = (User)session.getAttribute("currentUser");
    List<Post> posts = pd.getAllPosts();
    
    LikeDao lDao = new LikeDao(ConnectionProvider.getConnection());
    
    for(Post post : posts) {
    %>
        <div class="post">
                        <div class="header">
                            <div class="header_info">
                                <div class="post_profile">
                                    <img src="pics/<%= ud.getUserbyUserId(post.getUid()).getProfile() %>" alt="">
                                    <div class="info">
                                        <p><%= ud.getUserbyUserId(post.getUid()).getUsername() %></p>
                                        <span>
                                            <%
                                                String t1 = post.getPostDate();
                                                Date d2 = new Date();
                                                Date d1=new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(t1);
			
			
                                                long diff = d2.getTime() - d1.getTime();

                                                long diffSeconds = diff / 1000 % 60;
                                                long diffMinutes = diff / (60 * 1000) % 60;
                                                long diffHours = diff / (60 * 60 * 1000) % 24;
                                                long diffDays = diff / (24 * 60 * 60 * 1000);
                                                
                                                String postDate = "1 sec ago";
                                                if(diffDays>7) {
                                                    postDate = t1.substring(0, 11);
                                                } else if(diffDays == 7) {
                                                    postDate = "1 week ago";
                                                } else if(diffDays>0) {
                                                    if(diffDays==1) {
                                                        postDate = diffDays + " day ago";
                                                    } else {
                                                        postDate = diffDays + " days ago";
                                                    }
                                                } else if(diffHours>0) {
                                                    postDate = diffHours + " hrs ago";
                                                } else if(diffMinutes>0) {
                                                    postDate = diffMinutes + " min ago";
                                                } else {
                                                    postDate = diffSeconds + " sec ago";
                                                }
                                            %>
                                            <%= postDate %>
                                        </span>
                                        <i class='bx bxs-group'></i>
                                    </div>
                                </div>
                                <i class='bx bx-dots-horizontal-rounded dots'></i>
                            </div>
                            <p class="post_title"><%= post.getPdescription() %></p>
                        </div>
                        <div class="img_post">
                            <img src="postImages/<%= post.getPhoto() %>" alt="">
                        </div>
                        <div class="footer">
                            <div class="likes">
                                <div class="like_love">
                                    <i class='bx bxs-like'></i>
                                    <i class='bx bxs-heart'></i>
                                    <p class="likeCount<%= post.getPid() %>"><%= lDao.countLikes(post.getPid()) %></p>
                                </div>
                                <p>1.1K comments 123 shares</p>
                            </div>
                            <hr>
                            <div class="other_details">
                                <div onclick="doLike(<%= post.getPid() %>, <%= currentUser.getId() %>)" class="footer_icon">
                                    <i class='bx bx-like <%= lDao.getCssClass(post.getPid(), currentUser.getId()) %> post_Like<%= post.getPid() %>'></i>
                                    <p>Like</p>
                                </div>
                                <div class="footer_icon">
                                    <i class='bx bx-comment'></i>
                                    <p>Comment</p>
                                </div>
                                <div class="footer_icon">
                                    <i class='bx bx-share bx-flip-horizontal'></i>
                                    <p>Share</p>
                                </div>
                                <div class="footer_icon">
                                    <img src="pics/<%= ud.getUserbyUserId(post.getUid()).getProfile() %>" alt="">
                                    <i class='bx bx-caret-down'></i>
                                </div>
                            </div>
                        </div>
                    </div>
    <%
    }
%>
