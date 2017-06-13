package com.yolo.model.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.ClassTotalInfo;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.CreateClassInfo;
import com.yolo.model.domain.PageBean;

public interface CreateClassInfoDao {
	public CreateClassInfo search(int createcode);
	public List<CreateClassInfo> searchAll(PageBean bean) ;
	public ClassTotalInfo searchClassInfo(int createcode);
	public List<ClassTotalInfo> searchClassInfo(PageBean bean);
	public int getCount(PageBean bean);
	public void add(CreateClassInfo createclassinfo);
	public void update(CreateClassInfo createclassinfo);
	public void remove(int createcode);
	public List<ClassInfo> subject(String cid);
	public CreateClassInfo searchByCcode(int ccode);
}

