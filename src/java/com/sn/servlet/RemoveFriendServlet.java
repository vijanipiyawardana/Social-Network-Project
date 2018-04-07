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
public class RemoveFriendServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{         
        User loggedUser = (User) request.getSession().getAttribute("User");
        Long id = (Long.parseLong(request.getParameter("id")));
       
        UserJpaController ujc = new UserJpaController();
        ujc.removeFriend(loggedUser.getId(), id);
        request.getRequestDispatcher("friendList.jsp").forward(request, response);
        
    }
}
