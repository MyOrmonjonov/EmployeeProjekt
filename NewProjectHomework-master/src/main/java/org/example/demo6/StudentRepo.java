package org.example.demo6;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class StudentRepo {

    public static List<Student>getStudents(Integer groupId){
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {

            TypedQuery<Student> query = entityManager.createQuery(
                    "FROM Student s WHERE s.groups.id = :groupId", Student.class);
            query.setParameter("groupId",groupId );
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error fetching groups for modulId: " + groupId, e);
        }
    }
}
