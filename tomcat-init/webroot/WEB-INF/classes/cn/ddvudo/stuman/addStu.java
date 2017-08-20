package cn.ddvudo.stuman;

public class addStu{
	private String id;
	private String name;
	private String sex;
	private String grade;
	
	public void setId(String idn){
		this.id=idn;
	}
	public void setName(String namen){
		this.name=namen;
	}
	public void setSex(String sexn){
		this.sex=sexn;
	}
	public void setGrade(String graden){
		this.grade=graden;
	}
	
	
	public String getId(){
		return id;
	}
	public String getName(){
		return name;
	}
	public String getSex(){
		return sex;
	}
	public String getGrade(){
		return grade;
	}
}