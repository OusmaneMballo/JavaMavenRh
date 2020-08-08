package services;

import model.Specialite;
import org.hibernate.Session;
import utils.HibernateUtil;

import javax.ejb.Stateless;
import java.util.List;

@Stateless
public class SpecialiteDAO implements ISpecialite {

    Session session;

    public SpecialiteDAO() {
        this.session = HibernateUtil.getSession();
    }

    @Override
    public List<Specialite> findByServiceId(int id) {
        return session.createQuery("select s from Specialite s join s.service srv where srv.id =: id",
                Specialite.class).setParameter("id", id).list();
    }
}
