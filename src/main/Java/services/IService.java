package services;

import com.google.inject.internal.util.$Function;
import model.Service;

import javax.ejb.Local;
import java.util.List;
@Local
public interface IService {
    public List<Service> findAll();
}
