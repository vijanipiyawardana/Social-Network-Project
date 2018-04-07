/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sn.jpacontroller;

import com.sn.entity.Friendship;
import com.sn.entity.User;
import com.sn.entity.User;
import com.sn.jpacontroller.exceptions.NonexistentEntityException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author vijani
 */

//THIS CLASS IS USED TO HANDLE USER DATA 
public class UserJpaController implements Serializable {

    private EntityManagerFactory emf = null;

    public UserJpaController() {
        this.emf = Persistence.createEntityManagerFactory("SocialNetworkPU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    //ADD NEW USER
    public void add(User user) {

        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(user);
            em.flush();
            System.out.println("New user added");
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    //FIND USER BY THEIR ID
    public User findById(Long id) {
        EntityManager em = null;
        em = getEntityManager();
        try {
            return em.find(User.class, id);

        } finally {
            em.close();
        }
    }

    //FIND USER BY THEIR USERNAME
    public User findByUserName(String userName) {
        EntityManager em = getEntityManager();
        try {
            System.out.println("user is :" + userName);
            Query query = em.createQuery("select u from User u where u.username = :n");
            query.setParameter("n", userName);
            try {
                return (User) query.getSingleResult();
            } catch (Exception e) {
                return null;
            }
        } finally {
            em.close();
        }
    }

    //DELETE USER
    public void destroyUser(Long id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            try {
            } catch (EntityNotFoundException e) {
                throw new NonexistentEntityException("The user with id " + id + " no longer exists.", e);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    //FIND ALL REGISTERED USERS AS A LIST
    public List<User> findAllUsers() {
        EntityManager em = null;
        try {
            em = getEntityManager();
            Query query = em.createQuery("SELECT u FROM User u");
            List<User> resultList = query.getResultList();
            return resultList;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    //FIND USERS WHO ARE NOT ADDED TO CURRENT LOGGED USER
    public List<User> findNonFriends(Long userId) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            Query query = em.createQuery("select u from User u where u.id not in (select f.user1.id,f.user2.id from Friendship f where f.user1.id= :id or f.user2.id = :id)");
            query.setParameter("id", userId);
            List<User> resultList = query.getResultList();
            return resultList;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    //FIND USERS WHO ARE ADDED TO CURRENT LOGGED USER
    public List<User> findFriends(Long userId) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            Query query = em.createQuery("select f from Friendship f where f.user1.id = :id or f.user2.id = :id");
            query.setParameter("id", userId);
            List<Friendship> resultList = query.getResultList();
            List<User> users = new ArrayList<User>();
            for (Friendship f : resultList) {
                if (f.getUser1().getId() == userId) {
                    users.add(f.getUser2());
                } else {
                    users.add(f.getUser1());
                }
            }
            System.out.println("");
            return users;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    //ADD A NEW FRIEND
    public void addFriend(Long id1, Long id2) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            User user1 = em.find(User.class, id1);
            User user2 = em.find(User.class, id2);
            Friendship friendship = new Friendship();
            friendship.setUser1(user1);
            friendship.setUser2(user2);
            em.getTransaction().begin();
            em.persist(friendship);
            em.flush();
            System.out.println("New friendship added");
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }
    
    //TO REMOVE A FRIEND
    public void removeFriend(Long id1, Long id2){
        EntityManager em = null;
        try{
            em = getEntityManager();
            User user1 = em.find(User.class, id1);
            User user2 = em.find(User.class, id2);
            em.getTransaction().begin();
            Query query = em.createQuery("DELETE FROM Friendship f where f.user1.id =:u1 and f.user2.id =:u2");
            query.setParameter("u1", id1);
            query.setParameter("u2", id2);
            query.executeUpdate();
            Query query2 = em.createQuery("DELETE FROM Friendship f where f.user1.id =:u1 and f.user2.id =:u2");
            query2.setParameter("u2", id1);
            query2.setParameter("u1", id2);
            query2.executeUpdate();          
            em.getTransaction().commit();
        }finally{
            if(em!=null){
                em.close();
            }
        }
    }

    //EDIT ABOUT YOU DATA
    public void editAboutYou(Long userId, String about) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            User user = em.find(User.class, userId);
            em.getTransaction().begin();
            user.setAboutMe(about);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }      
    }

    //CHANGE USER'S PHONE NUMBER
    public void editPhoneNo(Long userId, String phoneNo) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            User user = em.find(User.class, userId);
            em.getTransaction().begin();
            user.setPhoneNo(phoneNo);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    //CHANGE USER'S NAME
    public void changeName(Long userId, String fName, String lName) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            User user = em.find(User.class, userId);
            em.getTransaction().begin();
            user.setFname(fName);
            user.setLname(lName);
            em.merge(user);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    //FIND USER'S EDUCATION DETAILS
    public String findEducationDetails(Long userId) {
        EntityManager em = null;
        String eduInfo;
        try {
            em = getEntityManager();
            User user = em.find(User.class, userId);
            eduInfo = user.getEducationInfo();
            return eduInfo;
        } finally {
            if (em != null) {
                em.close();
            }
        }

    }

    //FIND USERS WORK DETAILS
    public String findWorkDetails(Long userId) {
        EntityManager em = null;
        String workInfo;
        try {
            em = getEntityManager();
            User user = em.find(User.class, userId);
            workInfo = user.getWorkInfo();
            return workInfo;
        } finally {
            if (em != null) {
                em.close();
            }
        }

    }

    //ADD NEW EDUCATION DETAIL INTO USER'S ACCOUNT
    public void addNewEducation(Long userId, String newEdu) {
        EntityManager em = null;
        try {
            System.out.println("@ jpa : edu :" + newEdu);
            em = getEntityManager();
            User user = em.find(User.class, userId);
            em.getTransaction().begin();
            String eduHistory = user.getEducationInfo();
            if (eduHistory == null) {
                eduHistory = newEdu;
            } else {
                eduHistory = eduHistory + "\n" + newEdu;
            }
            user.setEducationInfo(eduHistory); 
            em.merge(user);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    //ADD NEW EDUCATION DETAIL INTO USER'S ACCOUNT
    public void addNewWork(Long userId, String newWork) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            User user = em.find(User.class, userId);
            em.getTransaction().begin();
            String workHistory = user.getWorkInfo();
            if (workHistory == null) {
                workHistory = newWork;
            } else {
                workHistory = workHistory + "\n" + newWork;
            }
            user.setWorkInfo(workHistory);
            em.merge(user);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}
