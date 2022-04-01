package dao;

import models.Brand;

public class BrandDao extends EntityDao<Brand,Integer> {

	@Override
	public Class<Brand> getClassEntity() {
		return Brand.class;
	}
		
}
