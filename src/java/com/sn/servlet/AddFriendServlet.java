/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sn.servlet;

import com.sn.entity.User;
import com.sn.jpacontroller.UserJpaController;
import java.io.IOException;
import java.rmi.ServerException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vijani
 */
public class AddFriendServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        Long id = Long.parseLong(request.getParameter("id")); //TAKE FRIEND
        User user = (User) request.getSession().getAttribute("User"); //TAKE CURRENT USER
        Long idLogged = user.getId();
        System.out.println("Add Friend ID : " + id); //TESTING
        System.out.println("Logged user ID : " + idLogged); //TESTING
        UserJpaController ujc = new UserJpaController();
        ujc.addFriend(id, idLogged);
        request.getRequestDispatcher("friendList.jsp").forward(request, response);
    }
}
