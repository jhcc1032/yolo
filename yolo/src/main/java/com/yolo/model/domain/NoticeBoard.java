package com.yolo.model.domain;

import java.io.Serializable;
import java.util.List;

public class NoticeBoard implements Serializable{
	private int no;
	private String mno;
	private String title;
	private String regdate;
	private String contents;
	private List<NoticeBoardFile>  files;    //조인 정보
	public NoticeBoard(){}
	public NoticeBoard(int no, String mno, String title) {
		this.no = no;
		this.mno = mno;
		this.title = title;
	}
	public NoticeBoard(int no, String mno, String title, String regdate, String contents) {
		this.no = no;
		this.mno = mno;
		this.title = title;
		this.regdate = regdate;
		this.contents = contents;
	}
	public NoticeBoard(int no, String mno, String title, String regdate, String contents, List<NoticeBoardFile> files) {
		this.no = no;
		this.mno = mno;
		this.title = title;
		this.regdate = regdate;
		this.contents = contents;
		this.files = files;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Board [no=").append(no).append(", mno=").append(mno)
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
	public String getmno() {
		return mno;
	}
	public void setmno(String mno) {
		this.mno = mno;
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
	public List<NoticeBoardFile> getFiles() {
		return files;
	}
	public void setFiles(List<NoticeBoardFile> files) {
		this.files = files;
	}
	
	
}
