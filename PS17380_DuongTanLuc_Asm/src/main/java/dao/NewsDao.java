package dao;

import java.util.List;

import javax.persistence.TypedQuery;

import contraints.JpaUltils;
import models.News;

public class NewsDao extends EntityDao<News,Integer> {


	public List<News> findAllDescByDate() {
		em= JpaUltils.getEntityManager();
		
		try {
			em.getTransaction().begin();
			
			String jpql = "SELECT o FROM News o order by o.createDate desc";
			TypedQuery<News> query = em.createQuery(jpql, News.class);
			List<News> list = query.getResultList();
				
			em.getTransaction().commit();
			return list;
		} catch (Exception e2) {
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}
	
	public List<News> findPage(int page , int size) {
		em= JpaUltils.getEntityManager();
		
		try {
			em.getTransaction().begin();
			
			String jpql = "SELECT o FROM News o";
			TypedQuery<News> query = em.createQuery(jpql, News.class);
			
			query.setFirstResult(page * size);
			query.setMaxResults(size);
			List<News> list = query.getResultList();
				
			em.getTransaction().commit();
			return list;
		} catch (Exception e2) {
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}
	

	@Override
	public Class<News> getClassEntity() {
		return News.class;
	}
}
