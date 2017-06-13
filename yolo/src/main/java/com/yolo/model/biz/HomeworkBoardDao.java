package com.yolo.model.biz;

import java.util.List;

import com.yolo.model.domain.HomeworkBoard;
import com.yolo.model.domain.HomeworkBoardFile;
import com.yolo.model.domain.HomeworkBoardReply;
import com.yolo.model.domain.HomeworkBoardReplyFile;
import com.yolo.model.domain.PageBean;

public interface HomeworkBoardDao {
	public void add(HomeworkBoard board);

	public void update(HomeworkBoard board);

	public void remove(int no);

	public HomeworkBoard search(int no);

	public List<HomeworkBoard> searchAll(PageBean bean);

	public int getCount(PageBean bean);

	public int getHomeworkBoardNo();
	
	public int getHomeworkBoardReplyNo();

	public void addFiles(List<HomeworkBoardFile> files, int bno);

	public void removeFiles(int bno);
	
	public List<HomeworkBoardReply> selectReplys(int no);
	
	public void addReply(HomeworkBoardReply reply);
	
	public void addReplyFiles(List<HomeworkBoardReplyFile> files, int rno);
	
	public List<HomeworkBoardReplyFile> selectReplyFiles(int rno);
	
}
