/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 *
 * @author shahz
 */
@Entity
public class Rsong {
     @Id
    @GeneratedValue
    int id;
    String userid;

     
    String Song;

    public Rsong() {
    }

    public Rsong(String userid, String Song) {
        this.userid = userid;
        this.Song = Song;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getSong() {
        return Song;
    }

    public void setSong(String Song) {
        this.Song = Song;
    }
    
}
