package com.yolo.model.domain;

import java.io.Serializable;
import java.util.List;

public class QnaBoard implements Serializable{
	private int roNum;
	public int getRoNum() {
		return roNum;
	}
	public void setRoNum(int roNum) {
		this.roNum = roNum;
	}
	private int no;
	private String id;
	private String title;
	private String regdate;
	private String contents;
	
	private List<QnaBoardReply> replys;
	
	public QnaBoard(){}
	public QnaBoard(int no, String title) {
		this.no = no;
		this.title = title;
	}
	
	public QnaBoard(int no, int roNum, String title, String regdate, String contents) {
		this.no = no;
		this.roNum = roNum;
		this.title = title;
		this.regdate = regdate;
		this.contents = contents;
	}
	public QnaBoard(int no, int roNum, String id, String title, String regdate, String contents, List<QnaBoardReply> replys) {
		this.no = no;
		this.roNum = roNum;
		this.id = id;
		this.title = title;
		this.regdate = regdate;
		this.contents = contents;
		this.replys = replys;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Board [no=").append(no)
				.append(", title=").append(title)
				.append(", regdate=").append(regdate).append(", contents=")
				.append(contents).append(", files=")
				.append(replys).append("]");
		return builder.toString();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public List<QnaBoardReply> getReplys() {
		return replys;
	}
	public void setReplys(List<QnaBoardReply> replys) {
		this.replys = replys;
	}
	
	
	
}
