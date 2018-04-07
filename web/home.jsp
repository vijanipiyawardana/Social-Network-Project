<%-- 
    Document   : Home
    Created on : Sep 2, 2014, 2:50:12 PM
    Author     : vijani
--%>

<%@page import="com.sn.entity.News"%>
<%@page import="java.util.List"%>
<%@page import="com.sn.jpacontroller.NewsJpaController"%>
<%@page import="com.sn.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Network :: Home Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />	</head>
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>

    <!--column style-->
    <style type="text/css"> 

        #content-1 { 
            float:left; 
            width:20%; 
            height:auto;
            padding:10px; 
             
        } 
        #content-2-1 { 
            float:left; 
            width:55.59%;
            height:auto;
            padding:10px; 
            
        } 
        #content-2-2 { 
            float:right; 
            width:20%; 
            height:auto;
            padding:10px; 
            
        } 


    </style> 


    <body style="background-image: url('images/loginBack.jpg')">


    <center><img src = "images/logo.jpg" width="100%"></center>	
        <%User loggedUser = (User) request.getSession().getAttribute("User");%>
    <!---start-top-nav---->
    <div class="top-nav">
        <% String name = loggedUser.getFname() + " " + loggedUser.getLname();%>

        <ul>
            <li><a href ="profile.jsp"> <%=name%></a> </li>
            <li class="active"><a href="home.jsp">Home</a></li>
            <li><a href="photos.jsp">Photos</a></li>
            <li><a href="friendList.jsp">Friends</a></li>
            <li><a href="chatRoom.jsp">Chat Room</a></li>
            <li><a href = "files.jsp">Files</a></li>
            <li><a href="index.jsp">Logout</a></li>
        </ul>
    </div>
    <div class="clear"> </div>
    <!---End-top-nav---->


<!---start-content---->
<div id="body"> 

    <div id="main"> 
        <div id="content-1">
            <!--ads-->
        </div> 
        <div id="content-2"> 
            <div id="content-2-1">
                <center>
                    <h1><b><font style="color: skyblue">What's on your mind? Share with your friends!!</b></h1><br>
                </center>
                <form action="news" method="post">
                    <center>
                        <input type="text" name="title" style="width: 75%">
                        <textarea id="news_feed" name="content" style="width: 75%; height: 100px"></textarea><br>
                        <input type = "submit" value = "Update">
                    </center>
                </form> 

                <!-------------------------DISPLAY ALL NEWS UPDATES---------------------------------->

                <%
                    NewsJpaController njc = new NewsJpaController();
                    List<News> allNews = njc.findAllNews();
                    for (News n : allNews) {
                        String userName = n.getUser().getFname() + " " + n.getUser().getLname();
                        String title = n.getTitle();
                        String content = n.getContent();
                        String location = n.getLocation();
                        String updatedDate = n.getPosted_date().toString();
                %>
                <center><table style="width: 100%">
                    <tr>
                        <td><strong><font style="color:white"><%=userName%></font></strong></td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td><strong><u><font style="color:skyblue"><%=title%></font></u></strong></td>
                    </tr>
                    <tr>
                        <td><font style="color: skyblue"><%=content%></font></td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td><font style="color: highlight">--posted on <%=updatedDate%> from <%=location%></font></td>
                    </tr>
                    </table></center><br><br><br>
                <%
                    }
                %>

                <!----------------------------------------------------------------------------------->
            </div> 
            <div id="content-2-2">
                <!--ads-->
            </div> 
        </div> 
    </div> 

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
