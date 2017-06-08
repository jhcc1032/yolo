package com.yolo.model.biz;

import java.util.List;

import com.yolo.model.domain.HomeworkBoard;
import com.yolo.model.domain.HomeworkBoardFile;
import com.yolo.model.domain.PageBean;

public interface HomeworkBoardDao {
	public void add(HomeworkBoard board);

	public void update(HomeworkBoard board);

	public void remove(int no);

	public HomeworkBoard search(int no);

	public List<HomeworkBoard> searchAll(PageBean bean);

	public int getCount(PageBean bean);

	public int getHomeworkBoardNo();

	public void addFiles(List<HomeworkBoardFile> files, int bno);

	public void removeFiles(int bno);
}
