package util;

import entity.Product;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    private static final SessionFactory ourSessionFactory;

    static {
        try {
            Configuration configuration = new Configuration();
            configuration.configure();

            ourSessionFactory = configuration.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static Session getSession() throws HibernateException {
        return ourSessionFactory.openSession();
    }

    public static void main(final String[] args) throws Exception {
        final Session session = getSession();
        Transaction transaction =null;
        try {
            // Thêm sản phẩm vào database
            transaction = session.beginTransaction();
            Product p1 = new Product("PC",500);
            Product p2 = new Product("Television",700);
            Product p3 = new Product("Fan",900);
            session.save(p1);
            session.save(p2);
            session.save(p3);
            System.out.println("save success!!!");
            transaction.commit();

        }catch (Exception ex){
            if(transaction!=null){
                transaction.rollback();
            }
        } finally {
            session.close();
        }
    }
}