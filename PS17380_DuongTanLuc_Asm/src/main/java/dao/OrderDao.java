package dao;

import javax.persistence.TypedQuery;

import contraints.JpaUltils;
import models.Order;

public class OrderDao extends EntityDao<Order, Integer>{

	@Override
	public Class<Order> getClassEntity() {
		return Order.class;
	}
	
	public Order findLastOne() {
		em = JpaUltils.getEntityManager();
		try {
			em.getTransaction().begin();
			TypedQuery<Order> query = em.createNamedQuery(getClassEntity().getSimpleName() + ".findLastOne", getClassEntity());

			Order e = query.setMaxResults(1).getSingleResult();
			return e;
		} catch (Exception e2) {
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}
}
