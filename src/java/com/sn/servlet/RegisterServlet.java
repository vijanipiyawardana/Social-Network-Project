/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sn.servlet;

import com.sn.controller.UserController;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vijani
 */
public class RegisterServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String userName1 = request.getParameter("username1");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");

        UserController uc = new UserController();
        Boolean exist = uc.isUserExist(userName1);

        if (exist != false) {
            System.out.println("User already exist, cannot be added. Try again with a different username!");
        } else if (!(password1.equals(password2))) {
            System.out.println(password1);
            System.out.println(password2); 
            System.out.println("Password doesn't match");
        } else {
            uc.addUser(firstName, lastName, dob, gender, email, userName1, password1);
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
