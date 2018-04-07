<%-- 
    Document   : friendProfile
    Created on : Sep 9, 2014, 12:07:16 PM
    Author     : vijani
--%>

<%@page import="com.sn.jpacontroller.FileJpaController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sn.jpacontroller.PhotoJpaController"%>
<%@page import="com.sn.entity.User"%>
<%@page import="com.sn.jpacontroller.UserJpaController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Network :: Friend Profile Page</title>
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
        #content-4 { 
            float:left; 
            width:100%;
            height:auto;
            padding:10px; 
            background-color: papayawhip; 
        } 
        #content-5 { 
            float:left; 
            width:100%; 
            height:auto;
            padding:10px; 
            background-color: palegoldenrod; 
        } 

    </style> 
    <!--end of column style-->
    <body style="background-image: url('images/loginBack.jpg')">


    <center><img src = "images/logo.jpg" width="100%"></center>
        <%
            Long id = (Long.parseLong(request.getParameter("id")));
            UserJpaController ujc = new UserJpaController();
        %>
    <!--take friend id -->
    <%User friend = ujc.findById(id); %>
    <!---start-top-nav---->
    <div class="top-nav">
        <% String name = friend.getFname() + " " + friend.getLname();%>

        <ul>
            <li  class="active"><a href ="friendProfile.jsp"> <%=name%></a> </li> 
           
        </ul>
    </div>
    <div class="clear"> </div>
    <!---End-top-nav---->


    <!----start content----->
    
    <!--THIS DIV IS USED TO DISPLAY PROFILE PICTURE AND ABOUT ME-->
    <div id="content-1">
        <center><br><br><br>
            <%
                System.out.println("friend : " + friend);
                if (friend == null) {
                    out.print("no user");
                } else {
                    System.out.println("friend Gender : " + friend.getGender());
                    if (friend.getGender().equals("Male")) {%>

            <img src ="images/BoyUser.png">
            <%
            } else {
            %>
            <img src = "images/GirlUser.png">
            <%}
            }%>
        </center><br><br>


        <%
            String aboutMe = friend.getAboutMe();
            System.out.println("About friend: " + friend.getAboutMe());
            if (aboutMe == null) {
                aboutMe = "Say something about you..!";
            } else {
                aboutMe = friend.getAboutMe();
            }
        %>
        <center><textarea name="aboutYou" disabled="true"><%=aboutMe%></textarea><br>
        
        <br><br><br>
         <form action="removeFriendConfirm.jsp" method="post"><input type="hidden" name="id" value="<%= friend.getId()%>"><input type="submit" value="Remove Friend" /></form>
         </center>  
        <%
            String fName = friend.getFname();
            String lName = friend.getLname();
            String dob = friend.getDob().toString();
            String gender = friend.getGender();
            String email = friend.getEmail();
            String homeTown = friend.getHometown();
            String phoneNo = friend.getPhoneNo();
            System.out.println("friend birthday : " + dob);
        %>


    </div> 
    <!--THIS IS TO DISPLAY BASIC INFORMATION-->
    <div id="content-2"> 
        <pre>
       <u>Basic Information</u>
           
            First Name          :  <input type = "text" name = "fname" value="<%=fName%>" disabled="true"><br>
            Last Name           : <input type = "text" name = "lname" value="<%=lName%>" disabled="true"><br>
            
            <%
                fName = friend.getFname();
                lName = friend.getLname();
            %>
           
            Birthday            : <input type="text" name="dob" disabled="true" value="<%=dob%> "><br>
            Gender              : <input type="text" name = "gender" disabled="true" value="<%=gender%>"><br>
            Home Town           : <input type = "text" name = "hometown" disabled="true" value = "<%=homeTown%>"><br><br>
       <u>Contact Information</u><br>
            Email               : <input type="email" name ="email" disabled="true" value="<%=email%>">
     
            Phone no            : <input type="tel" name="phoneNo" value="<%=phoneNo%>" disabled="true">
           
        </pre>
    </div>
    
    <!--THIS IS TO DISPLAY EDUCATION AND WORK DETAILS-->
    <div id="content-3">
        <%
            String eduHistory = ujc.findEducationDetails(friend.getId());
            if (eduHistory == null) {
                eduHistory = "education details...";
            }
        %>
        <u>Education</u><br>
        <textarea name="educationDetails" rows=8 cols=60 disabled="true">
 
            <%="\n" + eduHistory%> 
          
        
        </textarea><br>
        <br><br>

        <br><br>
        <%
            String workHistory = ujc.findWorkDetails(friend.getId());
            if (workHistory == null) {
                workHistory = "working details...";
            }
        %>
        <u>Work</u><br>
        <textarea name="workingDetails" rows=8 cols=60 disabled="true">
          
            <%="\n" + workHistory%>
          
        </textarea><br>
        <br><br>

    </div> 

    <!--THIS IS TO DISPLAY PHOTOS-->
    <div id="content-4">
        <center><h1><font style="color: navy"> <%=friend.getFname()%> 's Photos!</font></h1></center><br>

        <%
            PhotoJpaController pjc = new PhotoJpaController();
            List<String> photoList = pjc.findPhotos(friend.getId()); 
            if (photoList == null) {
                photoList = new ArrayList<String>();
            }
            for (String fileName : photoList) {
        %>
        <a href = "images/<%=fileName%>" target="_blank"><img src="images/<%=fileName%>" width="300px" height="300px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </a>

        <%
            }
        %>
    </div>

    <!--THIS IS TO DISPLAY FILES-->
    <div id="content-5">
        <center><h1><font style="color: navy"> <%=friend.getFname()%> 's Files!</font></h1></center><br>

        <%
            FileJpaController fjc = new FileJpaController();

            List<String> fileList = fjc.findFiles(friend.getId());
            if (fileList == null) {
                fileList = new ArrayList<String>();
            }
            for (String fileName : fileList) {
        %>
        <a href = "files/<%=fileName%>" target="_blank"><%=fileName%>
            <br><br>
        </a>

        <%
            }
        %>
    </div>

    <!-----end content------->

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
