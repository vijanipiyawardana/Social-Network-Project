<%-- 
    Document   : index
    Created on : Aug 16, 2014, 1:46:41 PM
    Author     : vijani
--%>
<%@page import="com.sn.jpacontroller.UserJpaController"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.sn.entity.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Social Network :: User Login/Register Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />	</head>
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>

    <!--column style-->
    <style type="text/css"> 

        #content-1 { 
            float:left; 
            width:100%; 
            height:auto;
            padding:10px; 
            background-image: url('images/loginBack.jpg');
        }    
    </style> 
    
   <body style="background-image: url('images/loginBack.jpg')">
     <center><img src = "images/logo.jpg" width="100%"></center>
      
    <!-----start content------->
    <div id="content-1">
    <marquee><h3><font color = 'white'>Connect with your classmates</font></h3></marquee><br><br>
   
    <div align='center'>
        <form action = "login" method = "POST">
            <p>
            <font color='grey'><pre>
            Username : <input type = 'text' name = 'username'><br>
            Password : <input type = 'password' name = 'password'><br><br></pre>
            <input type = 'submit' value = 'Login'><br><br>
        </form>
        <hr>
        <div style="float:left; width:50%;">
            <div align = style="float:center">
                <img src="images/three.png"></div>

        </div>
        <div style="float:right; width:50%;">
            <br><h2><font style="color:navy">New user?<br> Register here!</h2>
            <br><br>
            <form action = "register" method = "POST"><pre>
First Name 	:     <input type = 'text' name = 'firstname'><br>
Last  Name 	:     <input type = 'text' name = 'lastname'><br>
Date of Birth	:         <input type = 'date' name = 'dob'><br>
Gender		:               <input type = 'radio' name ='gender' value = 'Male'> Male <input type = 'radio' name = 'gender' value = 'Female'> Female<br>
Email		:     <input type = 'email' name = 'email'><br>
Username 	:     <input type = 'text' name = 'username1'><br>
Password 	:     <input type = 'password' name = 'password1'><br>
Repeat Password : <input type = 'password' name = 'password2'><br><br></pre>
                <input type = 'submit' value = 'Register'></form></font>
            <br><br>
</div>

</div>    
</div>
<!--end content----->
    
    
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
