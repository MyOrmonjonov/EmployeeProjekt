package org.example.demo6;

import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addPayment")
public class AddPayment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            Integer studentId = Integer.parseInt(req.getParameter("studentId"));
            Integer amount = Integer.parseInt(req.getParameter("amount"));
            Integer courseId = Integer.parseInt(req.getParameter("courseId"));

            entityManager.getTransaction().begin();


            Student student = entityManager.find(Student.class, studentId);
            Course course = entityManager.find(Course.class, courseId);

            if (student == null || course == null) {
                resp.getWriter().write("Student or Course not found.");
                entityManager.getTransaction().rollback();
                return;
            }


            Integer currentAmount = student.getAmount();
            student.setAmount(currentAmount + amount);
            entityManager.merge(student);



            entityManager.getTransaction().commit();
            resp.sendRedirect("Course.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp?message=Internal server error");
        }
    }
}
