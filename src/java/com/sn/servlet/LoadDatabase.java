/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sn.servlet;

import com.sn.entity.User;
import com.sn.jpacontroller.FileJpaController;
import com.sn.jpacontroller.PhotoJpaController;
import com.sn.jpacontroller.UserJpaController;
import java.io.IOException;
import java.io.PrintWriter;
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
public class LoadDatabase extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        //ADD SOME USERS TO THE NETWORK
        List<User> users = Arrays.asList(
                new User("Vijani", "Piyawardana", "Female", "vijanipiyawardana@gmail.com", "viji", "123", "Panadura", new Date()), new User("Binali", "Perera", "Female", "binali@gmail.com", "binali", "123", "Panadura", new Date()), new User("Ravindu", "Kaluarachchi", "Male", "ravibada@yahoo.com", "ravi", "123", "Panadura", new Date()), new User("Randika", "Isuru", "Male", "isuru@gmail.com", "isuru", "123", "Colombo", new Date()), new User("Chooty", "Isuri", "Female", "isuri@gmail.com", "chooty", "123", "UK", new Date()), new User("Vindya", "Marasinghe", "Female", "vindi@gmail.com", "vindi", "123", "Homagama", new Date()), new User("Aruna", "Tebel", "Male", "teba@gmail.com", "teba", "123", "Panadura", new Date()), new User("Indunil", "Piyawardana", "Female", "indunil@gmail.com", "indu", "123", "Panadura", new Date()), new User("Yoshani", "Sophi", "Female", "yosh@gmail.com", "sophi", "123", "Galle", new Date()), new User("Shanaka", "Costa", "Male", "malli@gmail.com", "malli", "123", "Ja-ela", new Date())
        );
        UserJpaController ujc = new UserJpaController();
        for (User u : users) {
            ujc.add(u);
        }

        //ADD SOME PHOTOS AND FILES TO EACH USER
        List<User> allUsers = ujc.findAllUsers();
        for (User u : allUsers) {
            PhotoJpaController pjc = new PhotoJpaController();
            FileJpaController fjc = new FileJpaController();
            pjc.addPhoto(u.getId(), "001.jpg");
            pjc.addPhoto(u.getId(), "010.jpg");
            pjc.addPhoto(u.getId(), "005.jpg");
            if (u.getGender().equals("Male")) {
                fjc.addFile(u.getId(), "Lecture3.pdf");
                fjc.addFile(u.getId(), "library_system.doc");
            } else {
                fjc.addFile(u.getId(), "NORMALIZATION.pptx");
            }
        }

        out.write("<html>");
        out.write("<head>");
        out.write("</head>");
        out.write("<body>");
        out.write("<h3>Data loaded into the database. Go back to the login screen. :) </h3>");
        out.write("</body>");
        out.write("</html>");
    }
}
