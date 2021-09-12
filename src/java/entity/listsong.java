/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 *
 * @author shahz
 */
@Entity
public class listsong {
    
    
           @Id
            @GeneratedValue
            int id;
    String userid;    
    String playlistname;
   
    String playlistsong;
    String song;
    String pic;

    public listsong() {
    }

    public listsong(String userid, String playlistname, String playlistsong, String song, String pic) {
        this.userid = userid;
        this.playlistname = playlistname;
        this.playlistsong = playlistsong;
        this.song = song;
        this.pic=pic;
    }

    public String getSong() {
        return song;
    }

    public void setSong(String song) {
        this.song = song;
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

    public String getPlaylistname() {
        return playlistname;
    }

    public void setPlaylistname(String playlistname) {
        this.playlistname = playlistname;
    }

    public String getPlaylistsong() {
        return playlistsong;
    }

    public void setPlaylistsong(String playlistsong) {
        this.playlistsong = playlistsong;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }
    
    
}
