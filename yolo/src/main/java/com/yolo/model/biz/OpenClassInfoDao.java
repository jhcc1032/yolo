package com.yolo.model.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.Member;
import com.yolo.model.domain.OpenClassInfo;
import com.yolo.model.domain.PageBean;

public interface OpenClassInfoDao {
	public OpenClassInfo search(int createcode);
	public List<OpenClassInfo> searchAll(PageBean bean) ;
	public int getCount(PageBean bean);
	public void add(OpenClassInfo openclassinfo);
	public void update(OpenClassInfo openclassinfo);
	public void remove(int createcode);
}
