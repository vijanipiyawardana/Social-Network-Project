/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sn.servlet;

import com.sn.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ChatServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); 
        try {
            String message = request.getParameter("message_input");
            User user = (User) request.getSession().getAttribute("User");
            Long userId = user.getId();
            //THIS WILL NOT USE DATABASE, JUST KEEP MESSAGES IN ServletContext
            List<String> messageHistory = (List<String>) request.getServletContext().getAttribute("chat_history");
            if (messageHistory == null) {
                messageHistory = new ArrayList<String>();
                request.getServletContext().setAttribute("chat_history", messageHistory);
            }
            messageHistory.add(user.getFname() + " : " + message);
            request.getRequestDispatcher("chatRoom.jsp").forward(request, response);
        } finally {
            out.close();
        }
    }
}
