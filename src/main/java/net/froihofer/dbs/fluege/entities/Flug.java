package net.froihofer.dbs.fluege.entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Timestamp;

@Entity
@Table(name="flug")
public class Flug implements Serializable {
  private static final Logger log = LoggerFactory.getLogger(Flug.class);

  @Id
  @GeneratedValue
  private Integer flugNr;
  private String abflugplanet;
  private String zielplanet;
  private Timestamp abflugzeit;
  private Timestamp ankuftszeit;

  //No arguments constructor required for entity class
  public Flug(){}
  
  public Flug(String abflugplanet, String zielplanet, Timestamp abflugzeit,Timestamp ankuftszeit) {
    this.abflugplanet = abflugplanet;
    this.zielplanet = zielplanet;
    this.abflugzeit = abflugzeit;
    this.ankuftszeit= ankuftszeit;
  }
  
  public Integer getFlugNr() {
    return flugNr;
  }

  public void setFlugNr(Integer flugNr) {
    this.flugNr = flugNr;
  }

  public String getAbflugplanet() {
    return abflugplanet;
  }

  public void setAbflugplanet(String abflugplanet) {
    this.abflugplanet = abflugplanet;
  }
 
  public String getZielplanet() {
    return zielplanet;
  }

  public void setZielplanet(String zielplanet) {
    this.zielplanet = zielplanet;
  }
  
  public Timestamp getAbflugzeit() {
    return abflugzeit;
  }

  public void setAbflugzeit(Timestamp abflugzeit) {
    this.abflugzeit = abflugzeit;
  }
 
  public Timestamp getAnkuftszeit() {
    return ankuftszeit;
  }

  public void setAnkuftszeit(Timestamp ankuftszeit) {
    this.ankuftszeit = ankuftszeit;
  }
  
}
