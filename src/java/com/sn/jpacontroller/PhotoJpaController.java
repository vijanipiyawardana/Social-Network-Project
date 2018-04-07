/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sn.jpacontroller;

import com.sn.entity.Photo;
import com.sn.entity.User;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import org.eclipse.persistence.jpa.JpaHelper;

/**
 *
 * @author vijani
 */
public class PhotoJpaController implements Serializable {

    private EntityManagerFactory emf = null;

    public PhotoJpaController() {
        this.emf = Persistence.createEntityManagerFactory("SocialNetworkPU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    //METHOD TO ADD A PHOTO
    public void addPhoto(Long idLogged, String fileName) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            User user = em.find(User.class, idLogged);
            Photo photo = new Photo();
            photo.setUser(user);
            photo.setPhoto(fileName);
            em.getTransaction().begin();
            em.persist(photo);
            em.flush();
            System.out.println("New photo added");
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    //METHOD TO FIND ALL UPLOADED PHOTOS AS A LIST
    public List<String> findPhotos(Long userId) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            Query query = em.createQuery("select p from Photo p where p.user.id = :id");
            query.setParameter("id", userId);
            List<Photo> resultList = query.getResultList();
            List<String> fileNames = new ArrayList<String>();
            for (Photo p : resultList) {
                if (p.getUser().getId() == userId) {
                    fileNames.add(p.getPhoto());
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
