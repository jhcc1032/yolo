package com.yolo.model.biz;

import java.util.List;

import com.yolo.model.domain.QnaBoard;
import com.yolo.model.domain.PageBean;
import com.yolo.model.domain.QnaBoardReply;

public interface QnaBoardService {
	public void update(QnaBoard board);
	public void remove(int no);
	public QnaBoard search(int no);
	public void add(QnaBoard board, String dir);
	public List<QnaBoard> searchAll(PageBean bean);
	public void addReply(QnaBoardReply reply, int no);

}