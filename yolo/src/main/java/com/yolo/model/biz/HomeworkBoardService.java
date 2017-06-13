package com.yolo.model.biz;

import java.util.List;

import com.yolo.model.domain.HomeworkBoard;
import com.yolo.model.domain.HomeworkBoardReply;
import com.yolo.model.domain.PageBean;

public interface HomeworkBoardService {
	public void update(HomeworkBoard board);
	public void remove(int no);
	public HomeworkBoard search(int no);
	public void add(HomeworkBoard board, String dir);
	public List<HomeworkBoard> searchAll(PageBean bean);
	public void addReply(HomeworkBoardReply replys, String dir);
}