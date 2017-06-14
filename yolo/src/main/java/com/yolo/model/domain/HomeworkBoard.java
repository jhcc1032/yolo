package com.yolo.model.domain;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class HomeworkBoard implements Serializable{
	private int roNum;
	public int getRoNum() {
		return roNum;
	}
	public void setRoNum(int roNum) {
		this.roNum = roNum;
	}
	private int no;
	private String id;
	private String pw;
	private String title;
	private String regdate;
	private String contents;
	private String dueDate;
	private int week;
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	private List<HomeworkBoardReply> replys;
	
	private MultipartFile[] fileup;
	
	public MultipartFile[] getFileup() {
		return fileup;
	}
	public void setFileup(MultipartFile[] fileup) {
		this.fileup = fileup;
	}
	private List<HomeworkBoardFile>  files;    //조인 정보
	public HomeworkBoard(){}
	public HomeworkBoard(int no, String title) {
		this.no = no;
		this.title = title;
	}
	public HomeworkBoard(int no, int roNum, String title, String regdate, String contents, String dueDate) {
		this.no = no;
		this.roNum = roNum;
		this.title = title;
		this.regdate = regdate;
		this.contents = contents;
		this.dueDate = dueDate;
	}
	public HomeworkBoard(int no, String title, String regdate, String contents, String dueDate, List<HomeworkBoardFile> files, List<HomeworkBoardReply> replys) {
		this.no = no;
		this.title = title;
		this.regdate = regdate;
		this.contents = contents;
		this.dueDate = dueDate;
		this.files = files;
		this.replys = replys;
	}
	public HomeworkBoard(int no, int roNum, String id, String pw, String title, String regdate, String contents, List<HomeworkBoardFile> files, List<HomeworkBoardReply> replys) {
		this.no = no;
		this.roNum = roNum;
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.regdate = regdate;
		this.contents = contents;
		this.files = files;
		this.replys = replys;
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
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
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
	public List<HomeworkBoardFile> getFiles() {
		return files;
	}
	public void setFiles(List<HomeworkBoardFile> files) {
		this.files = files;
	}
	public List<HomeworkBoardReply> getReplys() {
		return replys;
	}
	public void setReplys(List<HomeworkBoardReply> replys) {
		this.replys = replys;
	}
	@Override
	public String toString() {
		return "HomeworkBoard [no=" + no + ", id=" + id + ", pw=" + pw
				+ ", title=" + title + ", regdate=" + regdate + ", contents="
				+ contents + ", dueDate=" + dueDate + ", week=" + week
				+ ", replys=" + replys + ", fileup=" + Arrays.toString(fileup)
				+ ", files=" + files + "]";
	}
	
	
	
	
}
