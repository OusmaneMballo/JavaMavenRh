package model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.util.List;

@Entity
public class Specialite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 30)
    private String libelle;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "service_id")
    private Service service;

    @JsonIgnore
    @ManyToMany(mappedBy = "specialites")
    private List<Medecin> medecins;

    public Specialite() {
    }

    public Specialite(int id, String libelle, Service service) {
        this.id = id;
        this.libelle = libelle;
        this.service = service;
    }

    public int getId() {
        return id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public List<Medecin> getMedecins() {
        return medecins;
    }

    public void setMedecins(List<Medecin> medecins) {
        this.medecins = medecins;
    }
}
