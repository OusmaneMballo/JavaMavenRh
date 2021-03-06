package services;

import model.Medecin;

import javax.ejb.Local;
import java.util.List;

@Local
public interface IMedecin {
    public List<Medecin> findAll();
    public int addMedecin(Medecin m);
}
