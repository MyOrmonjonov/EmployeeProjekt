package org.example.demo6;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class GroupRepo {


    public static List<Groups> getGroups(Integer modulId) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {

            TypedQuery<Groups> query = entityManager.createQuery(
                    "FROM Groups g WHERE g.modul.id = :modulId", Groups.class);
            query.setParameter("modulId", modulId);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error fetching groups for modulId: " + modulId, e);
        }
    }
}
