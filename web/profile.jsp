
<%@page import="com.sn.jpacontroller.UserJpaController"%>
<%-- 
    Document   : profile
    Created on : Sep 2, 2014, 3:29:15 PM
    Author     : vijani
--%>


<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.sn.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Network :: User Profile Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />	</head>
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>

    <!--column style-->
    <style type="text/css"> 

       #content-1 { 
            float:left; 
            width:25%; 
            height:500px;
            padding:10px; 
            background:#bfb; 
        } 
        #content-2 { 
            float:left; 
            width:31.56%;
            height:500px;
            padding:10px; 
            background:#ddf; 
        } 
        #content-3 { 
            float:left; 
            width:38.7%; 
            height:500px;
            padding:10px; 
            background:#dff;           
        } 
    </style> 
    <!--end of column style-->
    <body style="background-image: url('images/loginBack.jpg')">


    <center><img src = "images/logo.jpg" width="100%"></center>		
        <%User loggedUser = (User) request.getSession().getAttribute("User");%>
    <!---start-top-nav---->
    <div class="top-nav">
        <% String name = loggedUser.getFname() + " " + loggedUser.getLname();%>

        <ul>
            <li  class="active"><a href ="profile.jsp"> <%=name%></a> </li>
            <li><a href="home.jsp">Home</a></li>
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

<div id="content-1">
    <center><br><br><br>
        <%
            System.out.println("Logged User : " + loggedUser);
            if (loggedUser == null) {
                out.print("no user");
            } else {
                System.out.println("Logged User Gender : " + loggedUser.getGender());
                if (loggedUser.getGender().equals("Male")) {%>

        <img src ="images/BoyUser.png">
        <%
                } else {
        %>
        <img src = "images/GirlUser.png">
        <%
                }
            }
        %>
        </center><br><br>

    <form action="about" method="post">
        <%
            String aboutMe = loggedUser.getAboutMe();
            System.out.println("About loggedUser: " + loggedUser.getAboutMe());
            if (aboutMe == null) {
                aboutMe = "Say something about you..!";
            } else {
                aboutMe = loggedUser.getAboutMe();
            }
        %>
        <center><textarea name="aboutYou"><%=aboutMe%></textarea><br>
            <input type="submit" value="edit">

        </center>
    </form><br><br>

    <%
        String fName = loggedUser.getFname();
        String lName = loggedUser.getLname();
        String dob = loggedUser.getDob().toString();
        String gender = loggedUser.getGender();
        String email = loggedUser.getEmail();
        String homeTown = loggedUser.getHometown();
        String phoneNo = loggedUser.getPhoneNo();
        System.out.println("User birthday : " + dob);
    %>


</div> 
<div id="content-2"> 
   <pre>
       <u>Basic Information</u>
            <form action="name" method="post">
            First Name          :  <input type = "text" name = "fname" value="<%=fName%>"><br>
            Last Name           : <input type = "text" name = "lname" value="<%=lName%>"><br>
            <input type = "submit" value="Change Name">
                <%
                    fName = loggedUser.getFname();
                    lName = loggedUser.getLname();
                %>
            </form>
            Birthday            : <input type="text" name="dob" disabled="true" value="<%=dob%> "><br>
            Gender              : <input type="text" name = "gender" disabled="true" value="<%=gender%>"><br>
            Home Town           : <input type = "text" name = "hometown" disabled="true" value = "<%=homeTown%>"><br><br>
       <u>Contact Information</u><br>
            Email               : <input type="email" name ="email" disabled="true" value="<%=email%>">
            <form action="phoneNo" method="post">
            Phone no            : <input type="tel" name="phoneNo" value="<%=phoneNo%>"><input type="submit" value="edit">
            </form>
        </pre>
    </div> 
    <div id="content-3">
        <%          
            UserJpaController ujc = new UserJpaController();
            String eduHistory = ujc.findEducationDetails(loggedUser.getId());
            if (eduHistory == null) {
                eduHistory = "Add your education details...";
            }
        %>
        <u>Education</u><br>
        <textarea name="educationDetails" rows=8 cols=60>
       
            <%="\n" + eduHistory%> 
         
        
        </textarea><br>
        <form action="edu" method="post"> 
            <input type="text" name="educationInfo"><br><input type="submit" value="add"><br><br>
            <!--if it is what i think it is 1 large tokka coming up,where is the form? -->  
        </form><br><br>
        <%
            String workHistory = ujc.findWorkDetails(loggedUser.getId());
            if (workHistory == null) {
                workHistory = "Add your working details...";
            }
        %>
        <u>Work</u><br>
        <textarea name="workingDetails" rows=8 cols=60>
  
            <%="\n" + workHistory%>
         
        </textarea><br>
        <form action="work" method="post">
            <input type="text" name="workInfo"><br><input type="submit" value="add"><br><br>
        </form>
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
                    <li><a href="#">Upload Photos/Files</a></li>
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
