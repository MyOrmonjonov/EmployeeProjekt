package org.example.demo6;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.lang.reflect.ParameterizedType;
import java.util.List;

public class BaseRepo<T> {
    private final Class<T> persistenceClass;

    // Parametrsiz konstruktor
    public BaseRepo() {
        this.persistenceClass = (Class<T>) ((ParameterizedType)
                getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    public BaseRepo(Class<T> persistenceClass) {
        this.persistenceClass = persistenceClass;
    }

    public static Long count(String searchQuery) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            Query count = entityManager.createQuery("select count(c) from Course c");
            return (Long) count.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return 0L;
        }
    }



    public List<T> show(int page1, String searchQuery) {
        page1--; // Sahifa indekslashni boshqarish (1 o‘rniga 0 dan boshlash uchun)
        try (EntityManager em = MyListener.EMF.createEntityManager()) {
            // Asosiy JPQL so‘rovi
            String jpql = "FROM " + persistenceClass.getSimpleName() ;

            // Agar qidiruv parametri bo‘lsa, WHERE shartini qo‘shamiz
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                jpql += " WHERE LOWER(persistenceClass.getSimpleName().name) ILIKE LOWER(:searchQuery)";
            }

            TypedQuery<T> query = em.createQuery(jpql, persistenceClass);

            // Qidiruv parametrini o‘rnatish
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                query.setParameter("searchQuery", "%" + searchQuery + "%");
            }

            // Sahifalashni sozlash
            query.setMaxResults(10); // Har bir sahifadagi natijalar soni
            query.setFirstResult(page1 * 10); // Qaysi sahifadan boshlash

            // Natijalar ro‘yxatini qaytarish
            List<T> resultList = query.getResultList();
            System.out.println(resultList); // Tekshirish uchun konsolga chiqarish
            return resultList;
        } catch (Exception e) {
            e.printStackTrace(); // Xatolikni chiqarish
            return null; // Xatolik yuz berganda null qaytarish
        }
    }

}
