package models;
import java.sql.Timestamp;

public class Tweets implements java.io.Serializable {

	 private static final long serialVersionUID = 1L;

	 private Integer tid;
	 private String username;
	 private Integer uid;
	 private String avatar = "";
	 private Timestamp postDateTime;
	 private String content;
	 private Integer likes;

	 public Tweets() {
	 }

	 public Integer getTid() {
		 return this.tid;
	 }
	 
	 public void setTid(Integer tid) {
		 this.tid = tid;
	 }
	 
	 public Integer getLikes() {
		 return this.likes;
	 }
	 
	 public void setLikes(Integer likes) {
		 this.likes = likes;
	 }

	 public String getUsername() {
		 return this.username;
	 }
	 
	 public void setUsername(String username) {
		 this.username = username;
	 }
	 
	 public Integer getUid() {
		 return this.uid;
	 }
	 
	 public void setUid(Integer uid) {
		 this.uid = uid;
	 }
	 
	 public Timestamp getPostDateTime() {
		 return this.postDateTime;
	 }
	 public void setPostDateTime(Timestamp postDateTime) {
		 this.postDateTime = postDateTime;
	 }
	 
	 public String getContent() {
		 return this.content;
	 }
	 public void setContent(String content) {
		 this.content = content;
	 }
	 
	 public String getAvatar() {
			return avatar;
		}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

}
