/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sn.servlet;

import com.sn.controller.UserController;
import com.sn.entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vijani
 */
public class LoginServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        UserController uc = new UserController();
        System.out.println("*****************");
        User user = uc.userLogin(userName, password);
        if(user!=null){
            System.out.println("user is not null");
            request.getSession().setAttribute("User", user);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            
        }else{
            System.out.println("Incorrect Password!!");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}

