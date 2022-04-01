package dao;

import java.util.List;

public interface Dao<E,K> {
	public Class<E> getClassEntity();
	public void create(E obj);
	public void  update(E obj);
	public void  delete(E obj);
	public List<E>  findAll();
	public List<E>  findByKeyword(String keyword);
	public E findOne(K id);
}
