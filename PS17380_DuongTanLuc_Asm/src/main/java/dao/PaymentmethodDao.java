package dao;

import models.Paymentmethod;

public class PaymentmethodDao extends EntityDao<Paymentmethod,Integer> {

	@Override
	public Class<Paymentmethod> getClassEntity() {
		return Paymentmethod.class;
	}
		
}
