package com.yolo.model.domain;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class HomeworkBoard implements Serializable{
	private int no;
	private String id;
	private String pw;
	private String title;
	private String regdate;
	private String contents;
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
	public HomeworkBoard(int no, String title, String regdate, String contents) {
		this.no = no;
		this.title = title;
		this.regdate = regdate;
		this.contents = contents;
	}
	public HomeworkBoard(int no, String title, String regdate, String contents, List<HomeworkBoardFile> files, List<HomeworkBoardReply> replys) {
		this.no = no;
		this.title = title;
		this.regdate = regdate;
		this.contents = contents;
		this.files = files;
		this.replys = replys;
	}
	public HomeworkBoard(int no, String id, String pw, String title, String regdate, String contents, List<HomeworkBoardFile> files, List<HomeworkBoardReply> replys) {
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.regdate = regdate;
		this.contents = contents;
		this.files = files;
		this.replys = replys;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Board [no=").append(no)
				.append(", title=").append(title)
				.append(", regdate=").append(regdate).append(", contents=")
				.append(contents).append(", files=")
				.append(files).append("]");
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
	
	
}
