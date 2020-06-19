package models;

public class dTmodel implements java.io.Serializable {

	 private static final long serialVersionUID = 1L;

	 private String uid;
	 private Integer start;
	 private Integer end;
	 private Integer global;
	 
	 public dTmodel() {
		 this.start = 0;
		 this.end = 4;
	 }

	 public String getUid() {
		 return this.uid;
	 }
	 
	 public void setUid(String uid) {
		 this.uid = uid;
	 }
	 
	 public Integer getStart() {
		 return this.start;
	 }
	 
	 public void setStart(Integer start) {
		 this.start = start;
	 }
	 
	 public Integer getEnd() {
		 return this.end;
	 }
	 
	 public void setEnd(Integer end) {
		 this.end = end;
	 }

	 public Integer getGlobal() {
		 return this.global;
	 }
	 
	 public void setGlobal(Integer global) {
		 this.global = global;
	 }
}
