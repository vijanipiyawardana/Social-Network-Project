/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sn.servlet;

import com.sn.entity.User;
import com.sn.jpacontroller.UserJpaController;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vijani
 */
public class EditEducationInfoServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String eduInfo = request.getParameter("educationInfo");
        User user = (User) request.getSession().getAttribute("User");
        Long userId = user.getId();

        UserJpaController ujc = new UserJpaController();
        ujc.addNewEducation(userId, eduInfo);
        request.getRequestDispatcher("profile.jsp").forward(request, response);  
    }
}
