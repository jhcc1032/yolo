package com.yolo.model.biz;

import java.util.List;

import com.yolo.model.domain.QnaBoard;
import com.yolo.model.domain.PageBean;
import com.yolo.model.domain.QnaBoardReply;

public interface QnaBoardDao {
	public void add(QnaBoard board);

	public void update(QnaBoard board);

	public void remove(int no);

	public QnaBoard search(int no);

	public List<QnaBoardReply> searchReply(int no);
	
	public List<QnaBoard> searchAll(PageBean bean);

	public int getCount(PageBean bean);

	public int getQnaBoardNo();

	public void addFiles(List<QnaBoardReply> replys, int bno);

	public void removeFiles(int bno);
	
	public void addReply(QnaBoardReply reply);
	
	public int getReplyCount(int no);
	
}
