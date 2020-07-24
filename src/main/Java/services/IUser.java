package services;

import model.Utilisateur;

import javax.ejb.Local;

@Local
public interface IUser {
    public Utilisateur findUser(String username, String passwd);
}
