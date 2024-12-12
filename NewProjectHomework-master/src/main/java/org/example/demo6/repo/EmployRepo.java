package org.example.demo6.repo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.example.demo6.entity.Employee;
import org.example.demo6.entity.EmployeeEntity;
import org.example.demo6.entity.Report;

import java.util.ArrayList;
import java.util.List;

import static org.example.demo6.config.MyListener.EMF;

public class EmployRepo {

    public static List<Employee> show() {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            entityManager.getTransaction().begin();
            List resultList = entityManager.createQuery("from Employee ").getResultList();
            entityManager.getTransaction().commit();
            return resultList;
        }
    }

    public static List<EmployeeEntity> FindAll(int id) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            entityManager.getTransaction().begin();


            Employee employee = entityManager.find(Employee.class, id);


            List<EmployeeEntity> employeeEntities = entityManager.createQuery(
                            "SELECT ee FROM EmployeeEntity ee WHERE ee.employee = :employee", EmployeeEntity.class)
                    .setParameter("employee", employee)
                    .getResultList();

            entityManager.getTransaction().commit();

            return employeeEntities;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static List<Report> showReport() {
        List<Report> reportList = new ArrayList<>();

        try (EntityManager entityManager = EMF.createEntityManager()) {

            String sql = """
                                     SELECT
                                         u.firstname,
                                         u.lastname,
                                         SUM(CASE WHEN en.tyupe = 'Cash' THEN en.amount ELSE 0 END) AS cash_sum,
                                         SUM(CASE WHEN en.tyupe = 'Card' THEN en.amount ELSE 0 END) AS card_sum,
                                         SUM(CASE WHEN en.tyupe = 'Bank' THEN en.amount ELSE 0 END) AS bank_sum
                                     FROM users u
                                              LEFT JOIN employee e ON u.id = e.users_id
                                              LEFT JOIN employeeentity en ON e.id = en.employee_id
                                     GROUP BY  u.firstname, u.lastname
                                     
                                     
                                     
                                     
""";
            List<Object[]> results = entityManager.createNativeQuery(sql).getResultList();


            for (Object[] row : results) {
                String firstname = (String) row[0];
                String lastname = (String) row[1];
                Integer cash = (int) (row[2] != null ? ((Number) row[2]).doubleValue() : 0.0);
                Integer card = (int) (row[3] != null ? ((Number) row[3]).doubleValue() : 0.0);
                Integer bank = (int) (row[4] != null ? ((Number) row[4]).doubleValue() : 0.0);
                System.out.println(card);
                reportList.add(new Report(firstname, lastname, cash, card, bank));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reportList;
    }

}