/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sn.servlet;

import com.sn.entity.User;
import com.sn.jpacontroller.UserJpaController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vijani
 */
public class AboutServlet extends HttpServlet {
    @Override   //HAS TO OVERRIDE doPost METHOD OF HttpServlet , IN ORDER TO USE IN INSIDE OUR SERVLET
    //PARAMETERS TO HANDLE REQUEST AND RESPONSE
    //EXCEPTION HANDLING IOException FOR ANY INPUT OUTPUT ERROR , ServletException FOR ANY SERVLET EXCEPTION
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String aboutYou = request.getParameter("aboutYou"); //TAKE PARAMETER PASSING FROM profile.jsp
        User user = (User) request.getSession().getAttribute("User"); //TAKE CURRENT USER
        Long userId = user.getId();
        UserJpaController ujc = new UserJpaController();    //TAKE A NEW OBJECT
        ujc.editAboutYou(userId,aboutYou);  //CALL ITS' METHOD IN ORDER TO ADD IT INTO THE DATABASE
        
        user.setAboutMe(aboutYou);  //CHANGE CURRENT USER DETAIL
        request.getRequestDispatcher("profile.jsp").forward(request, response); //RETURN BACK TO THE CALLING PAGE
    }
}
