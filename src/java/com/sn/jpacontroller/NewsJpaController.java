/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sn.jpacontroller;

import com.sn.entity.News;
import com.sn.entity.User;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author vijani
 */
public class NewsJpaController implements Serializable{
     private EntityManagerFactory emf = null;

    public NewsJpaController() {
        this.emf = Persistence.createEntityManagerFactory("SocialNetworkPU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    //METHOD TO ADD A NEWS
    public void addNews(Long userId, String title, String content, String location, Date updatedDate) {
        EntityManager em = null;
        try{
            em = getEntityManager();
            User user = em.find(User.class, userId);
            News news = new News();
            news.setUser(user);
            news.setTitle(title);
            news.setContent(content);
            news.setPosted_date(updatedDate);
            news.setLocation(location);
            em.getTransaction().begin();
            em.persist(news);
            em.flush();
            System.out.println("New news update is added");
            em.getTransaction().commit();         
        }finally{
            if(em!=null){
                em.close();
            }
        }
    }
    
    //METHOD TO FIND ALL UPDATED NEWS
    public List<News> findAllNews(){
        EntityManager em = null;
        try{
            em = getEntityManager();
            Query query = em.createQuery("SELECT n FROM News n");
            List<News> resultList = query.getResultList();
            return resultList;
        }finally{
            if(em!=null){
                em.close();
            }
        }
    }
    
}
