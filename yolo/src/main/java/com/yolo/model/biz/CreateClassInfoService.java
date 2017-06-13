package com.yolo.model.biz;

import java.util.List;

import com.yolo.model.domain.ClassInfo;
import com.yolo.model.domain.ClassTotalInfo;
import com.yolo.model.domain.CreateClassInfo;
import com.yolo.model.domain.PageBean;

public interface CreateClassInfoService {
	public CreateClassInfo search(int createcode);
	public List<CreateClassInfo> searchAll(PageBean bean) ;
	public void add(CreateClassInfo createclassinfo);
	public void update(CreateClassInfo createclassinfo);
	public void remove(int createcode);
	public List<ClassInfo> subject(String cid);
	
	//추가
	public CreateClassInfo searchByCcode(int ccode);

	// Class + CreateClass 테이블 조인 정보
	public ClassTotalInfo searchClassInfo(int createcode);
	public List<ClassTotalInfo> searchClassInfo(PageBean bean);
}
