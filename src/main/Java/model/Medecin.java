package model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class Medecin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 60)
    private String prenom_nom;

    @Column(length = 15)
    private String telephone;

    @Column(length = 30)
    private String email;

    @Column(length = 100)
    private String adresse;

    @Temporal(TemporalType.DATE)
    private Date datenaissance;

    @ManyToOne
    @JoinColumn(name = "service_id")
    private Service service;

   @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
   @JoinTable(name="medecin_specialite",
           joinColumns = @JoinColumn(name = "madecin_id"),
            inverseJoinColumns = @JoinColumn(name = "specialite_id"))
    private List<Specialite> specialites;

    public Medecin() {
    }

    public Medecin(int id, String prenom_nom, Service service) {
        this.id = id;
        this.prenom_nom = prenom_nom;
        this.service = service;
    }

    public int getId() {
        return id;
    }

    public String getPrenom_nom() {
        return prenom_nom;
    }

    public void setPrenom_nom(String prenom_nom) {
        this.prenom_nom = prenom_nom;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public List<Specialite> getSpecialites() {
        return specialites;
    }

    public void setSpecialites(List<Specialite> specialites) {
        this.specialites = specialites;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public Date getDatenaissance() {
        return datenaissance;
    }

    public void setDatenaissance(Date datenaissance) {
        this.datenaissance = datenaissance;
    }
}
