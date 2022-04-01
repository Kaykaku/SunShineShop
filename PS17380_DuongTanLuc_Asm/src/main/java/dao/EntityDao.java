package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import contraints.*;

public abstract class EntityDao<E, K> implements Dao<E, K> {
	EntityManager em = null;

	@Override
	public void create(E obj) {
		em = JpaUltils.getEntityManager();

		try {
			em.getTransaction().begin();

			em.persist(obj);

			em.getTransaction().commit();
		} catch (Exception e2) {
			e2.printStackTrace();
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
	}

	@Override
	public void update(E obj) {
		em = JpaUltils.getEntityManager();

		try {
			em.getTransaction().begin();

			em.merge(obj);

			em.getTransaction().commit();
		} catch (Exception e2) {
			e2.printStackTrace();
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
	}

	@Override
	public void delete(E obj) {
		em = JpaUltils.getEntityManager();

		try {
			em.getTransaction().begin();

			em.remove(em.contains(obj) ? obj : em.merge(obj));

			em.getTransaction().commit();
		} catch (Exception e2) {
			e2.printStackTrace();
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
	}

	@Override
	public List<E> findAll() {
		em = JpaUltils.getEntityManager();

		try {
			em.getTransaction().begin();

			TypedQuery<E> query = em.createNamedQuery(getClassEntity().getSimpleName() + ".findAll", getClassEntity());
			List<E> list = query.getResultList();

			em.getTransaction().commit();
			return list;
		} catch (Exception e2) {
			e2.printStackTrace();
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}

	@Override
	public List<E> findByKeyword(String keyword) {
		em = JpaUltils.getEntityManager();

		try {
			em.getTransaction().begin();

			TypedQuery<E> query = em.createNamedQuery(getClassEntity().getSimpleName() + ".findByKeyWord",
					getClassEntity());
			query.setParameter("keyword", keyword);
			List<E> list = query.getResultList();

			em.getTransaction().commit();
			return list;
		} catch (Exception e2) {
			e2.printStackTrace();
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}

	@Override
	public E findOne(K id) {
		em = JpaUltils.getEntityManager();
		try {
			em.getTransaction().begin();
			TypedQuery<E> query = em.createNamedQuery(getClassEntity().getSimpleName() + ".findOne", getClassEntity());

			query.setParameter("id", id);
			E e = query.getSingleResult();
			return e;
		} catch (Exception e2) {
			e2.printStackTrace();
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}
}
