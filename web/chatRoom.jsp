<%-- 
    Document   : chatRoom
    Created on : Sep 2, 2014, 3:29:29 PM
    Author     : vijani
--%>

<%@page import="java.util.List"%>
<%@page import="com.sn.entity.User"%>
<%@page import="com.sn.jpacontroller.UserJpaController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Network :: Chat Room Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />	</head>
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>

    <body style="background-image: url('images/loginBack.jpg')">


    <center><img src = "images/logo.jpg" width="100%"></center>		
        <%User loggedUser = (User) request.getSession().getAttribute("User");%>
    <!---start-top-nav---->
    <div class="top-nav">
        <% String name = loggedUser.getFname() + " " + loggedUser.getLname();%>

        <ul>
            <li><a href ="profile.jsp"> <%=name%></a> </li>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="photos.jsp">Photos</a></li>
            <li><a href="friendList.jsp">Friends</a></li>
            <li class="active"><a href="chatRoom.jsp">Chat Room</a></li>
            <li><a href = "files.jsp">Files</a></li>
            <li><a href="index.jsp">Logout</a></li>           
        </ul>
    </div>
    <div class="clear"> </div>
    <!---End-top-nav---->


<!---start-content---->
<br>

<!--PUBLIC CHAT--->

<center>
    <form action="chat" method="post">
        <input type=text name="message_input" style="width: 220px; height: 50px; margin: 2px" >
        <input type="submit"  value="Send" style="width: 60px; margin: 2px" >
    </form>

    <textarea id="chat_box" readonly="readonly" style="width: 290px; height: 320px;  margin: 2px; resize: none">
  
        <%
            List<String> messageHistory = (List<String>) request.getServletContext().getAttribute("chat_history");
            if (messageHistory != null) {
                for (String m : messageHistory) {
        %>
        <%=m%> 
        <%
                }
            }
        %>
    </textarea></center>
<!---End-content---->

<!---start-footer---->
<div class="footer">
    <div class="wrap">
        <div class="footer-grids">
            <div class="footer-grid">
                <h3>ABOUT</h3>
                <p>Friends World is a Social Network for Schoolers or University Students which allows all basic features of a Social Network. Join and see it is for your entertainment.</p>
            </div>
            <div class="footer-grid">
                <h3>FEATURES</h3>
                <ul>
                    <li><a href="#">User Registration</a></li>
                    <li><a href="#">User Login</a></li>
                    <li><a href="#">Search Friends</a></li>
                    <li><a href="#">Add/Remove Friends</a></li>
                </ul>
            </div>
            <div class="footer-grid">
                <h3>FEATURES</h3>
                <ul>
                    <li><a href="#">User Profile</a></li>
                    <li><a href="#">Upload Photos, Files</a></li>
                    <li><a href="#">Public Chat</a></li>
                    <li><a href="#">News Feed</a></li>
                </ul>
            </div>
            <div class="footer-grid footer-lastgrid">
                <h3>CONTACT US</h3>
                <p>A V S Piyawardana</p>
                <p><a href="www.nsbm.lk">National Institute of Business Management</a></p>
                <div class="footer-grid-address">
                    <p>Tel.0774829853</p>
                    <p>Email:<a class="email-link" href="https://accounts.google.com/ServiceLogin?service=mail&passive=true&rm=false&continue=https://mail.google.com/mail/&ss=1&scc=1&ltmpl=default&ltmplcache=2&emr=1">vijanipiyawardana@gmail.com</a></p>
                </div>
            </div>
            <div class="clear"> </div>
        </div>
    </div>
</div>
<!---End-footer---->
<div class="clear"> </div>
<div class="copy-right">
    <p>Design by <a href="#">Vijani, Nishadi, Vindya of CS 12.1 NSBM</a></p>
</div>
</body>
</html>
