package services;

import model.Medecin;
import org.hibernate.Session;
import utils.HibernateUtil;

import javax.ejb.Stateless;
import java.util.List;
@Stateless
public class MedecinDAO implements IMedecin {

    Session session;

    public MedecinDAO() {

        session= HibernateUtil.getSession();
    }

    @Override
    public List<Medecin> findAll() {

        return session.createQuery("SELECT m from Medecin m", Medecin.class).list();
    }

    @Override
    public int addMedecin(Medecin m) {
        try{
            session.save(m);
            return 1;
        }catch (Exception exception){
            exception.getStackTrace();
        }
        return 0;
    }
}
