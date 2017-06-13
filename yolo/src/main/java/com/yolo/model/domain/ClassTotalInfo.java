package com.yolo.model.domain;

import java.io.Serializable;

public class ClassTotalInfo  implements Serializable{
	private int    ccode;			// 과목코드
	private String ctitle;			// 과목
	private int    chour;			// 수업시간
	private int    cscore;			// 학점(ex. 1주 or 2주 과정)
	private int    createcode;		// 개설코드
	private String createdate;		// 개설날짜
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
	public ClassTotalInfo(){}
	public ClassTotalInfo(int ccode, String ctitle, int chour, int cscore,
			int createcode, String createdate, String cid, String ctype,
			String cinstitution, String cintroduction, String cgoal,
			String clist, String cinstructor, String cinstintro,
			String cevaluation, String cbook) {
		super();
		this.ccode = ccode;
		this.ctitle = ctitle;
		this.chour = chour;
		this.cscore = cscore;
		this.createcode = createcode;
		this.createdate = createdate;
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
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
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
		return "ClassTotalInfo [ccode=" + ccode + ", ctitle=" + ctitle
				+ ", chour=" + chour + ", cscore=" + cscore + ", createcode="
				+ createcode + ", createdate=" + createdate + ", cid=" + cid
				+ ", ctype=" + ctype + ", cinstitution=" + cinstitution
				+ ", cintroduction=" + cintroduction + ", cgoal=" + cgoal
				+ ", clist=" + clist + ", cinstructor=" + cinstructor
				+ ", cinstintro=" + cinstintro + ", cevaluation=" + cevaluation
				+ ", cbook=" + cbook + "]";
	}
}
