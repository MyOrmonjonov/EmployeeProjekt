package org.example.demo6;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class ModulRepo{
    public static Long  count() {

        try (EntityManager entityManager=MyListener.EMF.createEntityManager()){
            Query count=entityManager.createQuery("select count(*) from Modul ",Long.class);
            return (Long) count.getSingleResult();
        }
    }
    public static List<Modul> getModulsByCourseId(int courseId, int page1) {
        page1--;
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            Query query = entityManager.createNativeQuery(
                            "SELECT * FROM modul m WHERE m.course_id = :courseId LIMIT 10 OFFSET :off", Modul.class)
                    .setParameter("off", page1 * 10)
                    .setParameter("courseId", courseId);
return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error fetching modules for courseId: " + courseId, e);
        }
    }
}
