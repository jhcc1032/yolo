package com.yolo.model.domain;

public class CourseScore {
	private String ctitle;
	private int score;
	private int rank;
	
	//constructor
	public CourseScore() {}

	public CourseScore(String ctitle, int score, int rank) {
		super();
		this.ctitle = ctitle;
		this.score = score;
		this.rank = rank;
	}

	//getter&setter
	public String getCtitle() {
		return ctitle;
	}


	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}


	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}
	
	//tostring
	
	@Override
	public String toString() {
		return "CourseScore [ctitle=" + ctitle + ", score=" + score + ", rank="
				+ rank + "]";
	}
}
