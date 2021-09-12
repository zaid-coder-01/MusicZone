package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Songs {

	@Id
	@GeneratedValue
	int id;
	String category;
	String language;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
	String artist;
	String songName;
	String Song;
	String thumb;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getSongName() {
		return songName;
	}
	public void setSongName(String songName) {
		this.songName = songName;
	}
	public String getSong() {
		return Song;
	}
	public void setSong(String song) {
		Song = song;
	}
	public String getThumb() {
		return thumb;
	}
	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
	public Songs(String category, String language, String artist, String songName, String song, String thumb) {
		super();
		this.category = category;
		this.language = language;
		this.artist = artist;
		this.songName = songName;
		this.Song = song;
		this.thumb = thumb;
	}
	public Songs() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
