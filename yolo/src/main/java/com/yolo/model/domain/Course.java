package com.yolo.model.domain;

public class Course {
	private int coursecode;
	private double score;
	private int createcode;
	private String id;
	
	//classinfo
	private String ctitle;		//과목이름
	private int ccode;			//과목코드
	private int chour;			//수업시간
	private int cscore;			//배점
	
	//createclassinfo
	private String createdate;
	
	//create
	private String progressPercentage;
	

	public Course() {
		
	}
	
	public Course(int coursecode, int createcode, String id) {
		this.coursecode = coursecode;
		this.createcode = createcode;
		this.id = id;
	}

	public Course(int coursecode, double score, int createcode, String id) {
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

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
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

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	
	public String getProgressPercentage() {
		return progressPercentage;
	}

	public void setProgressPercentage(String progressPercentage) {
		this.progressPercentage = progressPercentage;
	}

	@Override
	public String toString() {
		return "Course [coursecode=" + coursecode + ", score=" + score
				+ ", createcode=" + createcode + ", id=" + id + ", ctitle="
				+ ctitle + ", ccode=" + ccode + ", chour=" + chour
				+ ", cscore=" + cscore + ", createdate=" + createdate
				+ ", progressPercentage=" + progressPercentage + "]";
	}
	
}
