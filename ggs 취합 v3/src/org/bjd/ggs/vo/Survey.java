package org.bjd.ggs.vo;

public class Survey {

	private String gender,relation,reason;
	private int age,maxAge;
	
	public Survey(String gender, String relation, String reason, int age, int maxAge) {
		super();
		this.gender = gender;
		this.relation = relation;
		this.reason = reason;
		this.age = age;
		this.maxAge = maxAge;
	}

	public Survey() {
		super();
	}

	public Survey(String gender, int age, String relation, String reason) {
		super();
		this.gender = gender;
		this.age = age;
		this.relation = relation;
		this.reason = reason;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getMaxAge() {
		return maxAge;
	}

	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}
	
	
}
