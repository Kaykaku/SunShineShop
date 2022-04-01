package dao;

import java.util.List;

import javax.persistence.TypedQuery;

import contraints.JpaUltils;
import models.OrderDetail;

public class OrderDetailDao extends EntityDao<OrderDetail, Integer>{

	@Override
	public Class<OrderDetail> getClassEntity() {
		return OrderDetail.class;
	}
	public List<OrderDetail> findByOrder(int orderId) {
		em = JpaUltils.getEntityManager();
		try {
			em.getTransaction().begin();
			TypedQuery<OrderDetail> query = em.createNamedQuery(getClassEntity().getSimpleName() + ".findByOrder", getClassEntity());
			query.setParameter("id", orderId);

			List<OrderDetail> e = query.getResultList();
			return e;
		} catch (Exception e2) {
			e2.printStackTrace();
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}
	public List<OrderDetail> findByMonth(int month,int year) {
		em = JpaUltils.getEntityManager();
		try {
			em.getTransaction().begin();
			String jpql = "SELECT o FROM OrderDetail WHERE MONTH(o.order.orderDate)= :month and YEAR(o.order.orderDate)= :year";
			TypedQuery<OrderDetail> query = em.createQuery(jpql, getClassEntity());
			query.setParameter("month", month);
			query.setParameter("year", year);

			List<OrderDetail> e = query.getResultList();
			return e;
		} catch (Exception e2) {
			e2.printStackTrace();
			em.getTransaction().rollback(); 
		}
		JpaUltils.shutdown();
		return null;
	}
}
