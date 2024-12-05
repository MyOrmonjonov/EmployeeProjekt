package org.example.demo6;

import jakarta.persistence.EntityManager;

import java.util.List;

public class ReportRepo {


    public static List<Reprot> findAllRepo() {
        EntityManager em = MyListener.EMF.createEntityManager();
        try {
            return em.createQuery(
                    """
                    SELECT new org.example.demo6.Reprot(c.name, COUNT(s.id),sum(s.amount)) 
                    FROM Course c
                    JOIN Modul m ON c.id = m.course.id
                    JOIN Groups g ON m.id = g.modul.id
                    JOIN Student s ON g.id = s.groups.id
                    GROUP BY c.name
                    """,
                    Reprot.class
            ).getResultList();

        } finally {
            em.close();
        }
    }

}
