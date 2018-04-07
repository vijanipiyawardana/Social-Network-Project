/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sn.servlet;

import com.sn.entity.User;
import com.sn.jpacontroller.UserJpaController;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vijani
 */
public class TestData extends HttpServlet {

    Long id = null;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserJpaController ujc = new UserJpaController();
        User user = (User) request.getSession().getAttribute("User");
        Long id = user.getId();
        List<User> nonFriends = ujc.findNonFriends(id);
        System.out.println("non friends : " + nonFriends.size());
    }
}
