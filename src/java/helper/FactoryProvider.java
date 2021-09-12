package helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	
	public static SessionFactory fac;
	
	public static SessionFactory getFactory() {
		
		if(fac==null)
		{
			
			fac=new Configuration().configure("hibernet.cofg.xml").buildSessionFactory();
		}
		
		
	return fac;	
	}
	
}
