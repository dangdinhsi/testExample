package model;

import entity.Product;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

public class ProductModel {
    public List<Product> findAll() {
        List<Product> list = new ArrayList<>();
        try (Session session= HibernateUtil.getSession()) {
            list = session.createQuery("from Product ", Product.class).list();
        } catch (Exception e) {
            System.out.println("Cannot findAll student!, error message:"+e);
        }
        return list;
    }
    public Product findbyId(long id) {    // tìm sảm phẩm theo mã sản phẩm
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSession()) {
            transaction = session.beginTransaction();
            Product product = session.get(Product.class,id);
            transaction.commit();
            return product;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.out.println("error!!!!");
            return null;
        }
    }

}
