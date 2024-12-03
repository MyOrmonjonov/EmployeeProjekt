package org.example.demo6;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class ModulRepo {

    public static List<Modul> getModulsByCourseId(int courseId) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            TypedQuery<Modul> query = entityManager.createQuery(
                    "FROM Modul m WHERE m.course.id = :courseId", Modul.class);
            query.setParameter("courseId", courseId);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error fetching modules for courseId: " + courseId, e);
        }
    }
}
