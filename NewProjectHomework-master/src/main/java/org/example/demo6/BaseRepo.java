package org.example.demo6;

import jakarta.persistence.EntityManager;
import java.lang.reflect.ParameterizedType;
import java.util.List;

public class BaseRepo<T> {
    private final Class<T> persistenceClass;

    // Parametrsiz konstruktor
    public BaseRepo() {
        this.persistenceClass = (Class<T>) ((ParameterizedType)
                getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    // Parametrli konstruktor (Agar parametr kerak bo'lsa)
    public BaseRepo(Class<T> persistenceClass) {
        this.persistenceClass = persistenceClass;
    }

    // Ma'lumotlarni ko'rsatish uchun usul
    public List<T> show() {
        try (EntityManager em = MyListener.EMF.createEntityManager()) {
            List<T> resultList = em.createQuery("from " + persistenceClass.getSimpleName(), persistenceClass)
                    .getResultList();
            System.out.println(resultList);
            return resultList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
