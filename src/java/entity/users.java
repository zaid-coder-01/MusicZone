package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class users {

	@Id
	@GeneratedValue
	int id;
	String userid;
	String password;
	String email;
	String pic;
	String usertype;
	public users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public users(String userid, String password, String email, String pic,String usertype) {
		super();
		this.userid = userid;
		this.password = password;
		this.email = email;
		this.pic = pic;
		this.usertype=usertype;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	
	

	
}
