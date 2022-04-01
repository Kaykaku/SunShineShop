package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import contraints.JpaUltils;

public class StatictisDao {
	EntityManager em = null;
	public List<Object[]> orderByMonth() {
		em = JpaUltils.getEntityManager();

		try {
			em.getTransaction().begin();
			
			String jpql="SELECT DISTINCT YEAR(o.orderDate),MONTH(o.orderDate),count(o) FROM Order o GROUP BY YEAR(o.orderDate),MONTH(o.orderDate)";
			TypedQuery<Object[]> query = em.createQuery(jpql,Object[].class);
			List<Object[]> list = query.getResultList();

			em.getTransaction().commit();
			return list;
		} catch (Exception e2) {
			e2.printStackTrace();
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}
	
	public List<Object[]> bestProductSeller() {
		em = JpaUltils.getEntityManager();

		try {
			em.getTransaction().begin();
			
			String jpql="SELECT DISTINCT o.product.productID,o.product.image,"
					+ "o.product.productName,count(o),sum(o.quantity) "
					+ "FROM OrderDetail o GROUP BY o.product.productID,o.product.image,o.product.productName "
					+ "ORDER BY count(o) DESC";
			TypedQuery<Object[]> query = em.createQuery(jpql,Object[].class);
			List<Object[]> list = query.getResultList();

			em.getTransaction().commit();
			return list;
		} catch (Exception e2) {
			e2.printStackTrace();
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}
}
