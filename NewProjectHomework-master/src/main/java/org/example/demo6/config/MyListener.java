package org.example.demo6.config;


import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;

@WebListener
public class MyListener implements ServletContextListener {
public  static EntityManagerFactory EMF;
    public void contextInitialized(ServletContextEvent sce){
EMF= Persistence.createEntityManagerFactory("MyListener");
    }
}
