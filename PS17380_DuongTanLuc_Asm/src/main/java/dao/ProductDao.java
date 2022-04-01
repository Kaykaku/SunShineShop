package dao;

import java.util.List;

import javax.persistence.TypedQuery;

import contraints.JpaUltils;
import models.Product;

public class ProductDao extends EntityDao<Product,Integer> {

	public List<Product> findPage(int page , int size) {
		em= JpaUltils.getEntityManager();
		
		try {
			em.getTransaction().begin();
			
			String jpql = "SELECT o FROM Product o";
			TypedQuery<Product> query = em.createQuery(jpql, Product.class);
			
			query.setFirstResult(page * size);
			query.setMaxResults(size);
			List<Product> list = query.getResultList();
				
			em.getTransaction().commit();
			return list;
		} catch (Exception e2) {
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}
	public List<Product> findByCategory(int categoryId) {
		em= JpaUltils.getEntityManager();
		
		try {
			em.getTransaction().begin();
			
			String jpql = "SELECT  o FROM Product o WHERE o.category.categoryID= :id";
			TypedQuery<Product> query = em.createQuery(jpql, Product.class);
			query.setParameter("id", categoryId);
			
			List<Product> list = query.getResultList();
				
			em.getTransaction().commit();
			return list;
		} catch (Exception e2) {
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}
	public List<Product> findByBrand(int brandId) {
		em= JpaUltils.getEntityManager();
		
		try {
			em.getTransaction().begin();
			
			String jpql = "SELECT  o FROM Product o WHERE o.brand.brandID= :id";
			TypedQuery<Product> query = em.createQuery(jpql, Product.class);
			query.setParameter("id", brandId);
			
			List<Product> list = query.getResultList();
				
			em.getTransaction().commit();
			return list;
		} catch (Exception e2) {
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}
	public List<Product> FindNotInOrder(int orderId) {
		em= JpaUltils.getEntityManager();
		
		try {
			em.getTransaction().begin();
			
			TypedQuery<Product> query = em.createNamedQuery(getClassEntity().getSimpleName() + ".FindNotInOrder", getClassEntity());
			
			query.setParameter("id", orderId);
			List<Product> list = query.getResultList();
				
			em.getTransaction().commit();
			return list;
		} catch (Exception e2) {
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}
	@Override
	public Class<Product> getClassEntity() {
		return Product.class;
	}
		
}
