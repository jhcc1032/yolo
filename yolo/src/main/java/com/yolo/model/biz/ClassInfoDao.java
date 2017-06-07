package com.yolo.model.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.PageBean;

public interface ClassInfoDao {
	public ClassInfo search(String id);
	public List<ClassInfo> searchAll(PageBean bean) ;
	public int getCount(PageBean bean);
	public void add(ClassInfo member);
	public void update(ClassInfo member);
}
