<%-- 
    Document   : Files
    Created on : Sep 8, 2014, 4:55:47 PM
    Author     : vijani
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sn.jpacontroller.FileJpaController"%>
<%@page import="com.sn.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Network :: Files Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />	</head>
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>

</head>
 <!--column style-->
    <style type="text/css"> 

        #content-1 { 
            float:left; 
            width:100%; 
            height:auto;
            padding:10px; 
            background:#bfb; 
        } 
        #content-2 { 
            float:left; 
            width:100%;
            height:auto;
            padding:10px; 
            background:#ddf; 
        } 

    </style> 
    <!--------end style---------------------->
    
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
        <li><a href="chatRoom.jsp">Chat Room</a></li>
        <li class="active"><a href = "files.jsp">Files</a></li>
        <li><a href="index.jsp">Logout</a></li>      
    </ul>
</div>
<div class="clear"> </div>
<!---End-top-nav---->


<!---start-content---->



<%
    if (request.getAttribute("message") != null) {
%>
<div style="background-color: #aabdfd;margin: 10px;width: 60%;font-weight: bolder" >
    &starf; <%=request.getAttribute("message")%>
</div>
<br/>
<%}%>
<div id="content-1">
    <form action="file" enctype="multipart/form-data" method="post">
       
        <input type="file" name="file" /><br/>
        <input type="submit" value="Upload" />  
    </form>   

</div>
<div id="content-2">
    <center><h1><font style="color: navy"> Uploaded Files!</font></h1></center><br>

    <%
        FileJpaController fjc = new FileJpaController();
        Long userId = loggedUser.getId();
        List<String> fileList = fjc.findFiles(userId); //////////error ??
        if (fileList == null) {
            fileList = new ArrayList<String>();
        }
        for (String fileName : fileList) {
    %>
    <a href = "files/<%=fileName%>" target="_blank"><%=fileName%>
        <br><br>
    </a>

    <%}%>
</div>


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
