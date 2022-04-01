package dao;

import javax.persistence.TypedQuery;

import contraints.JpaUltils;
import models.Account;

public class AccountDao extends EntityDao<Account, Integer> {

	@Override
	public Class<Account> getClassEntity() {
		return Account.class;
	}
	public Account findByUsername(String username) {
		em = JpaUltils.getEntityManager();
		try {
			em.getTransaction().begin();
			String jpql ="SELECT o FROM Account o WHERE username = :username";
			TypedQuery<Account> query = em.createQuery(jpql, Account.class);
			query.setParameter("username", username);
			Account e = query.getSingleResult();
			return e;
		} catch (Exception e2) {
			em.getTransaction().rollback();
		}
		JpaUltils.shutdown();
		return null;
	}
}
