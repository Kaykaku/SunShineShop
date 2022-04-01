package contraints;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUltils {
	private static EntityManagerFactory emf;
	
	public static EntityManager getEntityManager() {
		if( emf==null || !emf.isOpen()) {
			emf = Persistence.createEntityManagerFactory("SunshineStore");
		}
		return emf.createEntityManager();
	}
	
	public static void shutdown() {
		if(emf!=null || emf.isOpen()) {
			emf.close();
		}
		emf = null;
	}
}
