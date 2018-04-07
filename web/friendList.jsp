<%-- 
    Document   : friendList
    Created on : Sep 2, 2014, 3:29:43 PM
    Author     : vijani
--%>

<%@page import="java.util.List"%>
<%@page import="com.sn.jpacontroller.UserJpaController"%>
<%@page import="com.sn.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Network :: Friend List Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />	</head>
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>
    <!--column style-->
    <style type="text/css"> 

        #content-1 { 
            float:left; 
            width:47%; 
            height:438px;
            padding:10px; 
            background:#bfb; 
            overflow: scroll;
        } 
        #content-2 { 
            float:left; 
            width:50%;
            height:438px;
            padding:10px; 
            background:#ddf; 
            overflow: scroll;
        } 

    </style> 
    <!--end of column size-->
    <body style="background-image: url('images/loginBack.jpg')">


     <center><img src = "images/logo.jpg" width="100%"></center>	
    <!----------------TAKE LOGGED USER DETAILS TO BE USED LATER--------------->
    <%
        User loggedUser = (User) request.getSession().getAttribute("User");
        String name = loggedUser.getFname() + " " + loggedUser.getLname();
        Long userId = loggedUser.getId();
    %>
    <!------------------------------------------------------------------------>
    <!---start-top-nav---->
    <div class="top-nav">


        <ul>
            <li><a href ="profile.jsp"> <%=name%></a> </li>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="photos.jsp">Photos</a></li>
            <li class="active"><a href="friendList.jsp">Friends</a></li>
            <li><a href="chatRoom.jsp">Chat Room</a></li>
            <li><a href = "files.jsp">Files</a></li>
            <li><a href="index.jsp">Logout</a></li>
        </ul>
    </div>
    <div class="clear"> </div>
    <!---End-top-nav---->


<!---start-content---->
<div id="content-1">
    <center><h3><u><font style="font-family: arial; color: navy">Find Friends</u></h3> </center> 
    
    <!---------------Display all non friends as suggestions ------------------>
    <%
        UserJpaController ujc = new UserJpaController();
        List<User> allUsers = ujc.findAllUsers();
        System.out.println("non friends : " + allUsers.size());
        List<User> addedFriends = ujc.findFriends(userId);
        for (User user : allUsers) {
            if (!user.getId().equals(loggedUser.getId())) {

                if (!addedFriends.contains(user)) {
    %><form action="addFriend" method="post" >
        <input type="hidden" name="id" value="<%= user.getId()%>">
        <table style="width:100%">
            <tr>
                <td>
                    <%
                        if (user.getGender() == "Male") {
                    %>

                    <img src = "images/boyfiftypix.png">
                    <%
                    } else {
                    %>
                    <img src = "images/girlfiftypix.png">
                    <%
                        }
                    %>

                    <%=user.getFname() + " " + user.getLname()%>
                </td>
                <td style="width:100px">
                    <input type = "submit" value = "Add Friend">
                </td>
            </tr>
        </table></form>
    <br><br>
    <%
                }
            }
        }
    %>
</div>
<!---------------------------------------------------------------------------->

<!---------------------display friends you added------------------------------>
<div id="content-2">
    <center><h3><u><font style="font-family: arial; color: navy">My Friends</u></h3> </center> 
                <%                   
                    List<User> friends = ujc.findFriends(userId);

                    System.out.println("user friends size :" + friends.size());
                    for (User u : friends) {

                %>
    <form name="myForm" action="friendProfile.jsp" method="post" > 
        <input type="hidden" name="id" value="<%= u.getId()%>">
        
    <table style="width:100%">
        <tr>
            <td>
                <%                    if (u.getGender() == "Male") {
                %>

                <img src = "images/boyfiftypix.png">
                <%
                } else {
                %>
                <img src = "images/girlfiftypix.png">
                <%
                    }
                %>

                <%=u.getFname() + " " + u.getLname()%>
            </td>
            <td style="width:100px">
                    <input type = "submit" value = "View Details" onclick="window.location.href='friendProfile.jsp'" />
            </td>
        </tr>
    </table></form>
    <br><br>
    <%
           
        }
    %>
</div>
<!---------------------------------------------------------------------------->
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
