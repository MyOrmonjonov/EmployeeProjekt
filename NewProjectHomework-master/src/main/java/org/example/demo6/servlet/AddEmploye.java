package org.example.demo6.servlet;

import jakarta.persistence.EntityManager;
import org.example.demo6.entity.Employee;
import org.example.demo6.entity.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static org.example.demo6.config.MyListener.EMF;

@WebServlet("/add")
public class AddEmploye extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        Integer salary = Integer.parseInt(req.getParameter("salary"));

        try (EntityManager entityManager = EMF.createEntityManager()) {
            entityManager.getTransaction().begin();


            Users user = new Users(firstName, lastName);
            entityManager.persist(user);


            Employee employee = new Employee(user, salary);
            entityManager.persist(employee);

            entityManager.getTransaction().commit();
            resp.sendRedirect("Home.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error while saving employee and user");
        }
    }
}
