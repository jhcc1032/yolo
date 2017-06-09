package com.yolo.model.domain;

public class Course {
	private int coursecode;
	private int score;
	private int createcode;
	private String id;

	public Course() {
		
	}
	
	public Course(int coursecode, int createcode, String id) {
		super();
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

	@Override
	public String toString() {
		return "Course [coursecode=" + coursecode + ", score=" + score
				+ ", createcode=" + createcode + ", id=" + id + "]";
	}	
	
}
