package com.yolo.model.biz;

import java.util.List;

import com.yolo.model.domain.NoticeBoard;
import com.yolo.model.domain.NoticeBoardFile;
import com.yolo.model.domain.PageBean;

public interface NoticeBoardDao {
	public void add(NoticeBoard NoticeBoard);

	public void update(NoticeBoard NoticeBoard);

	public void remove(int no);

	public NoticeBoard search(int no);

	public List<NoticeBoard> searchAll(PageBean bean);

	public int getCount(PageBean bean);

	public int getNoticeBoardNo();

	public void addFiles(List<NoticeBoardFile> files, int bno);

	public void removeFiles(int bno);
}
