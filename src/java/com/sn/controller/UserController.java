/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sn.controller;

import com.sn.entity.User;
import com.sn.jpacontroller.UserJpaController;

/**
 *
 * @author vijani
 */
//THIS CLASS ACTS AS AN INTERMEDIATE CLASS BETWEEN RegisterServlet.java and UserJpaContoller.java
public class UserController {

    public void addUser() {

    }

    public void addUser(String firstName, String lastName, String dob, String gender, String email, String userName1, String password1) {

        User user = new User();
        user.setFname(firstName);
        user.setLname(lastName);
        //user.setDob(dob);
        user.setGender(gender);
        user.setEmail(email);
        user.setUsername(userName1);
        user.setPassword(password1);
        System.out.println("--------------------------------------------****-"); //TESTING
        new UserJpaController().add(user);
    }


    //TO CHECK IF THE USER IS CURRENTLY EXIST IN THE DATABASE , userName shoul be unique (primary key)
    public Boolean isUserExist(String userName) {
        User user = null;
        user = new UserJpaController().findByUserName(userName);
        if (user != null) {
            return true;
        } else {
            return false;
        }

    }

    //THIS METHOD IS USED TO CHECK FOR THE CORRECT PASSWORD
    public User userLogin(String userName, String password) {
        User user = null;
        user = new UserJpaController().findByUserName(userName);
        System.out.println("from jsp "+ password + " user " + user); //TESTING
        if(user == null){
            return null;
        }
        System.out.println("from database "+ user.getPassword()); //TESTING
        
        System.out.println("from jsp "+ password.length() + " user.pwd " + user.getPassword().length()); //TESTING
        if (!user.getPassword().equals(password)) {
            return null;
        } else {
            return user;
        }
    }
    
    
    
}
