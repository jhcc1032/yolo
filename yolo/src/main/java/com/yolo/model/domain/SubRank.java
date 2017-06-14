package com.yolo.model.domain;

public class SubRank {

	private int rank;
	private String id;
	private String name;
	private double score;
	
	
	public SubRank(){}
	public SubRank(int rank, String id, String name, double score) {
		super();
		this.rank = rank;
		this.id = id;
		this.name = name;
		this.score = score;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SubRank [rank=").append(rank).append(", id=")
				.append(id).append(", name=").append(name).append(", score=")
				.append(score).append("]");
		return builder.toString();
	}
	
	
	
	
}
