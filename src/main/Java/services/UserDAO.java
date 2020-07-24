package services;

import model.Utilisateur;
import org.hibernate.Session;
import utils.HibernateUtil;

import javax.ejb.Stateless;

@Stateless
public class UserDAO implements IUser{

    Session session;

    public UserDAO() {
        session= HibernateUtil.getSession();
    }

    @Override
    public Utilisateur findUser(String username, String passwd) {

        try {
            return session.createQuery("SELECT u FROM Utilisateur u " +
                    "WHERE u.username = :username AND u.passwd = :pwd", Utilisateur.class)
                    .setParameter("username", username)
                    .setParameter("pwd", passwd).getSingleResult();
        }
        catch (Exception e){
            return null;
        }

    }
}
