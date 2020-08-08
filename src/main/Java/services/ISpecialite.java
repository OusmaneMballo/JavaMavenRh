package services;

import model.Service;
import model.Specialite;

import javax.ejb.Local;
import java.util.List;
@Local
public interface ISpecialite {
    public List<Specialite> findByServiceId(int id);
}
