/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sn.servlet;

import com.sn.entity.User;
import com.sn.jpacontroller.FileJpaController;
import com.sn.jpacontroller.PhotoJpaController;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author vijani
 */
@MultipartConfig
public class UploadFileServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        //GETS ABSOLUTE PATH OF THE WEB APPLICATION
        String appPath = request.getServletContext().getRealPath("");
        //CONSTRUCTS PATH OF THE DIRECTORY TO SAVE UPLOADED FILE
        String savePath = appPath + File.separator + "files"; //NAME OF YOUR FILES FOLDER
        /**
        * UPLOADED FILES WILL BE DELETED WITH EACH CLEAN AND BUILD
        * THEN HAVE TO BACKUP BEFORE CLEAN AND BUILD AND PUT THERE AFTER
        * SEE INSIDE THE PROJECT FOLDER
        * EVERY THING THAT HAPPENS WHILE RUNNING ARE INSIDE THE BUILD FOLDER
        * SO WHEN CLEAN AND BUILD, THE BUILD FOLDER IS CLEANED AND BUILT AGAIN
        * CREATES THE SAVE DIRECTORY IF IT DOES NOT EXIST     
        */
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            part.write(savePath + File.separator + fileName);
           
            //THIS CODE IS FOR DATABASE HANDLING
            User user = (User) request.getSession().getAttribute("User");
            Long idLogged = user.getId();
            FileJpaController fjc = new FileJpaController();

            fjc.addFile(idLogged, fileName);
            request.getRequestDispatcher("files.jsp").forward(request, response);           
        }

        request.setAttribute("message", "Upload has been done successfully!");
        
    }

    /**
     * EXTRACTS FILE NAME FROM HTTP HEADER CONTENT-DISPOSITION
     * 
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

}
