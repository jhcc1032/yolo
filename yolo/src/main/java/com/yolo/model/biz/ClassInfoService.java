package com.yolo.model.biz;

import java.util.List;

import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.PageBean;

public interface ClassInfoService {
	public ClassInfo search(int ccode);
	public List<ClassInfo> searchAll(PageBean bean) ;
	public void add(ClassInfo classinfo);
	public void update(ClassInfo classinfo);
	public void remove(int ccode);
}
