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
public class Playlist {
    
           @Id
            @GeneratedValue
            int id;
    String userid;    
    String playlistname;

    public Playlist() {
    }

    public Playlist(String userid, String playlistname) {
        this.userid = userid;
        this.playlistname = playlistname;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPlaylistname() {
        return playlistname;
    }

    public void setPlaylistname(String playlistname) {
        this.playlistname = playlistname;
    }
    
    
}


