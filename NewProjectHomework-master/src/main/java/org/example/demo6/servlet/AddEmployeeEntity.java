package org.example.demo6.servlet;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import org.example.demo6.entity.Employee;
import org.example.demo6.entity.EmployeeEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static org.example.demo6.config.MyListener.EMF;

@WebServlet("/addEmployeeEntity")
public class AddEmployeeEntity extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("id"));
        Integer amount = Integer.parseInt(req.getParameter("amount"));
        String payType = req.getParameter("payType");

        try (EntityManager entityManager = EMF.createEntityManager()) {
            entityManager.getTransaction().begin();

            Employee employee = entityManager.find(Employee.class, id);

            if (employee == null) {
                resp.sendRedirect("error.jsp");
                return;
            }

            Integer currentSalary = employee.getSalary() != null ? employee.getSalary() : 0;
            Integer currentPaid = employee.getPaid() != null ? employee.getPaid() : 0;
            Integer unpaid = currentSalary - currentPaid;

            if (amount > unpaid) {
                req.setAttribute("errorMessage", "Kiritilgan summa mavjud miqdordan oshib ketdi! Iltimos, summani kamaytiring.");
                req.getRequestDispatcher("payEmp.jsp").forward(req, resp);
                return;
            }

            EmployeeEntity employeeEntity = new EmployeeEntity();
            employeeEntity.setEmployee(employee);
            employeeEntity.setAmount(amount);
            employeeEntity.setTyupe(payType);

            entityManager.persist(employeeEntity);

            employee.setLefts(unpaid - amount);
            employee.setPaid(currentPaid + amount);
            entityManager.merge(employee);

            entityManager.getTransaction().commit();

            resp.sendRedirect("Home.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}
