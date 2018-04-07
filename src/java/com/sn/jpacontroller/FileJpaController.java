/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sn.jpacontroller;

import com.sn.entity.File;
import com.sn.entity.User;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author vijani
 */
public class FileJpaController implements Serializable{
    
    private EntityManagerFactory emf = null;

    public FileJpaController() {
        this.emf = Persistence.createEntityManagerFactory("SocialNetworkPU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    //METHOD TO ADD A NEW FILE INTO A DATABASE
     public void addFile(Long idLogged, String fileName) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            User user = em.find(User.class, idLogged);
            File file = new File();
            file.setUser(user);
            file.setFile(fileName);
            em.getTransaction().begin();
            em.persist(file);
            em.flush();
            System.out.println("New file added");
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }
     
    //METHOD TO FIND ALL UPLOADED FILES
    public List<String> findFiles(Long userId) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            Query query = em.createQuery("select f from File f where f.user.id = :id");
            query.setParameter("id", userId);
            List<File> resultList = query.getResultList();
            List<String> fileNames = new ArrayList<String>();
            for (File f : resultList) {
                if (f.getUser().getId() == userId) {
                    fileNames.add(f.getFile());
                } else {
                    fileNames.add(null);
                }
            }
            return fileNames;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}
