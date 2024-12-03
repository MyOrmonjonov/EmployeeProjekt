package org.example.demo6;

import jakarta.persistence.EntityManager;

import java.util.List;

public class CourseshowRepo {


    public static List<Course> showCourse(){

       try(  EntityManager em = MyListener.EMF.createEntityManager();) {
           em.getTransaction().begin();
           List<Course> resultList = em.createQuery("select s from Course s ", Course.class).getResultList();
           System.out.println(resultList);
           em.getTransaction().commit();
           return resultList;
       }


    }
}
