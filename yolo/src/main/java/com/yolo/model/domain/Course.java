package com.yolo.model.domain;

public class Course {
	private int coursecode;
	private int score;
	private int createcode;
	private String id;
	
	private String ctitle;
	private int ccode;
	private int chour;
	private int cscore;

	public Course() {
		
	}
	
	public Course(int coursecode, int createcode, String id) {
		this.coursecode = coursecode;
		this.createcode = createcode;
		this.id = id;
	}

	public Course(int coursecode, int score, int createcode, String id) {
		this.coursecode = coursecode;
		this.score = score;
		this.createcode = createcode;
		this.id = id;
	}
	
	


	public Course(int createcode, String id) {
		super();
		this.createcode = createcode;
		this.id = id;
	}

	public int getCoursecode() {
		return coursecode;
	}

	public void setCoursecode(int coursecode) {
		this.coursecode = coursecode;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getCreatecode() {
		return createcode;
	}

	public void setCreatecode(int createcode) {
		this.createcode = createcode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	

	public int getCcode() {
		return ccode;
	}

	public void setCcode(int ccode) {
		this.ccode = ccode;
	}

	public int getChour() {
		return chour;
	}

	public void setChour(int chour) {
		this.chour = chour;
	}

	public int getCscore() {
		return cscore;
	}

	public void setCscore(int cscore) {
		this.cscore = cscore;
	}

	@Override
	public String toString() {
		return "Course [coursecode=" + coursecode + ", score=" + score
				+ ", createcode=" + createcode + ", id=" + id + "]";
	}
	/*
	public void setCtitle1(String ctitle2) {
		this.ctitle = ctitle2;
	}*/
}
