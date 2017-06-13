package com.yolo.model.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class HomeworkBoardReply {
	int rno;
	String contents;
	String writer;
	String regdate;
	String sfileName;
	String rfileName;
	int no;
	private MultipartFile[] fileup;

	public MultipartFile[] getFileup() {
		return fileup;
	}

	public void setFileup(MultipartFile[] fileup) {
		this.fileup = fileup;
	}
	
	private List<HomeworkBoardReplyFile>  files;    //조인 정보
	
	public HomeworkBoardReply() {
		super();
	}

	public HomeworkBoardReply(int rno, String contents, String writer,
			String regdate, int no) {
		super();
		this.rno = rno;
		this.contents = contents;
		this.writer = writer;
		this.regdate = regdate;
		this.no = no;
	}
	
	public HomeworkBoardReply(int rno, String contents, String writer,
			String regdate, int no, List<HomeworkBoardReplyFile> files) {
		super();
		this.rno = rno;
		this.contents = contents;
		this.writer = writer;
		this.regdate = regdate;
		this.no = no;
		this.files = files;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public List<HomeworkBoardReplyFile> getFiles() {
		return files;
	}
	
	public void setFiles(List<HomeworkBoardReplyFile> files) {
		this.files = files;
	}

	public String getSfileName() {
		return sfileName;
	}

	public void setSfileName(String sfileName) {
		this.sfileName = sfileName;
	}

	public String getRfileName() {
		return rfileName;
	}

	public void setRfileName(String rfileName) {
		this.rfileName = rfileName;
	}
	
	
}
