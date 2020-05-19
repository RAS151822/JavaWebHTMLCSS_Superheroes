package ORM;
// Generated 08-may-2020 11:30:47 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Villanos generated by hbm2java
 */
public class Villanos  implements java.io.Serializable {


     private Integer idVillano;
     private Superheroes superheroes;
     private String nomVillano;
     private String habilidad;
     private Boolean capa;
     private char genero;
     private Set marcases = new HashSet(0);

    public Villanos() {
    }

	
    public Villanos(Superheroes superheroes, String nomVillano, char genero) {
        this.superheroes = superheroes;
        this.nomVillano = nomVillano;
        this.genero = genero;
    }
    public Villanos(Superheroes superheroes, String nomVillano, String habilidad, Boolean capa, char genero, Set marcases) {
       this.superheroes = superheroes;
       this.nomVillano = nomVillano;
       this.habilidad = habilidad;
       this.capa = capa;
       this.genero = genero;
       this.marcases = marcases;
    }
   
    public Integer getIdVillano() {
        return this.idVillano;
    }
    
    public void setIdVillano(Integer idVillano) {
        this.idVillano = idVillano;
    }
    public Superheroes getSuperheroes() {
        return this.superheroes;
    }
    
    public void setSuperheroes(Superheroes superheroes) {
        this.superheroes = superheroes;
    }
    public String getNomVillano() {
        return this.nomVillano;
    }
    
    public void setNomVillano(String nomVillano) {
        this.nomVillano = nomVillano;
    }
    public String getHabilidad() {
        return this.habilidad;
    }
    
    public void setHabilidad(String habilidad) {
        this.habilidad = habilidad;
    }
    public Boolean getCapa() {
        return this.capa;
    }
    
    public void setCapa(Boolean capa) {
        this.capa = capa;
    }
    public char getGenero() {
        return this.genero;
    }
    
    public void setGenero(char genero) {
        this.genero = genero;
    }
    public Set getMarcases() {
        return this.marcases;
    }
    
    public void setMarcases(Set marcases) {
        this.marcases = marcases;
    }




}


