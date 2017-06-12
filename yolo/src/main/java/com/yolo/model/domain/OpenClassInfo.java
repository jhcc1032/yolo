package com.yolo.model.domain;

public class OpenClassInfo {
	private int    createcode;		// 개설코드
	private String createdate;		// 개설날짜
	private int    ccode;			// 과목코드
	private String cid;				// 강사 아이디
	private String ctype;			// 교육 유형
	private String cinstitution;	// 교육 기관
	private String cintroduction;	// 과정 소개
	private String cgoal;			// 과정 목표
	private String clist;			// 과정 목차
	private String cinstructor;		// 강사
	private String cinstintro;		// 강사 소개
	private String cevaluation;		// 평가 형식
	private String cbook;			// 교재
	public OpenClassInfo(){}
	public OpenClassInfo(int createcode, String createdate, int ccode,
			String cid, String ctype, String cinstitution,
			String cintroduction, String cgoal, String clist,
			String cinstructor, String cinstintro, String cevaluation,
			String cbook) {
		this.createcode = createcode;
		this.createdate = createdate;
		this.ccode = ccode;
		this.cid = cid;
		this.ctype = ctype;
		this.cinstitution = cinstitution;
		this.cintroduction = cintroduction;
		this.cgoal = cgoal;
		this.clist = clist;
		this.cinstructor = cinstructor;
		this.cinstintro = cinstintro;
		this.cevaluation = cevaluation;
		this.cbook = cbook;
	}
	public int getCreatecode() {
		return createcode;
	}
	public void setCreatecode(int createcode) {
		this.createcode = createcode;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public String getCinstitution() {
		return cinstitution;
	}
	public void setCinstitution(String cinstitution) {
		this.cinstitution = cinstitution;
	}
	public String getCintroduction() {
		return cintroduction;
	}
	public void setCintroduction(String cintroduction) {
		this.cintroduction = cintroduction;
	}
	public String getCgoal() {
		return cgoal;
	}
	public void setCgoal(String cgoal) {
		this.cgoal = cgoal;
	}
	public String getClist() {
		return clist;
	}
	public void setClist(String clist) {
		this.clist = clist;
	}
	public String getCinstructor() {
		return cinstructor;
	}
	public void setCinstructor(String cinstructor) {
		this.cinstructor = cinstructor;
	}
	public String getCinstintro() {
		return cinstintro;
	}
	public void setCinstintro(String cinstintro) {
		this.cinstintro = cinstintro;
	}
	public String getCevaluation() {
		return cevaluation;
	}
	public void setCevaluation(String cevaluation) {
		this.cevaluation = cevaluation;
	}
	public String getCbook() {
		return cbook;
	}
	public void setCbook(String cbook) {
		this.cbook = cbook;
	}
	@Override
	public String toString() {
		return "OpenClassInfo [createcode=" + createcode + ", createdate="
				+ createdate + ", ccode=" + ccode + ", cid=" + cid + ", ctype="
				+ ctype + ", cinstitution=" + cinstitution + ", cintroduction="
				+ cintroduction + ", cgoal=" + cgoal + ", clist=" + clist
				+ ", cinstructor=" + cinstructor + ", cinstintro=" + cinstintro
				+ ", cevaluation=" + cevaluation + ", cbook=" + cbook + "]";
	}
	
	
	
	
}