package com.yolo.model.biz;

import java.util.List;

import com.yolo.model.domain.NoticeBoard;
import com.yolo.model.domain.PageBean;

public interface NoticeBoardService {
	public void update(NoticeBoard board);
	public void remove(int no);
	public NoticeBoard search(int no);
	public void add(NoticeBoard board, String dir);
	public List<NoticeBoard> searchAll(PageBean bean);

}