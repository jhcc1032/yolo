package com.yolo.model.biz;

import java.util.List;

import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.OpenClassInfo;
import com.yolo.model.domain.PageBean;

public interface OpenClassInfoService {
	public OpenClassInfo search(int createcode);
	public List<OpenClassInfo> searchAll(PageBean bean) ;
	public void add(OpenClassInfo openclassinfo);
	public void update(OpenClassInfo openclassinfo);
	public void remove(int createcode);
	public List<ClassInfo> subject(String cid);
	
	//추가
	public OpenClassInfo searchByCcode(int ccode);

	
}
