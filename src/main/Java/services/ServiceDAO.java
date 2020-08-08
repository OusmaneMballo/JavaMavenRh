package services;

import model.Service;
import org.hibernate.Session;
import utils.HibernateUtil;

import javax.ejb.Stateless;
import java.util.List;

@Stateless
public class ServiceDAO implements IService {
    Session session;

    public ServiceDAO() {
        this.session = HibernateUtil.getSession();
    }

    @Override
    public List<Service> findAll() {
        return session.createQuery("SELECT s from Service s", Service.class).list();
    }
}
