/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sn.servlet;

import com.sn.entity.User;
import com.sn.jpacontroller.NewsJpaController;
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
public class UpdateNewsServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        User user = (User) request.getSession().getAttribute("User");
        Long userId = user.getId();
        String location = user.getHometown();
        Date updatedDate = new Date();
        
        NewsJpaController njc = new NewsJpaController();
        njc.addNews(userId, title, content, location, updatedDate);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
