package com.yolo.model.biz;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yolo.model.domain.HomeworkBoard;
import com.yolo.model.domain.HomeworkBoardFile;
import com.yolo.model.domain.HomeworkBoardReply;
import com.yolo.model.domain.PageBean;
import com.yolo.model.domain.UpdateException;
import com.yolo.util.PageUtility;

@Service("homeworkBoardService")
public class HomeworkBoardServiceImpl implements HomeworkBoardService {
	@Autowired
	@Qualifier("homeworkBoardDao")
	private HomeworkBoardDao dao;

	@Override
	public void add(HomeworkBoard board, String dir) {
		try {
			int bno = dao.getHomeworkBoardNo();
			board.setNo(bno);

			dao.add(board);
			
			int size = 0;
			File[] files;
			
			MultipartFile[] fileup = board.getFileup();
			if(fileup != null) {
				size = fileup.length;
				files = new File[size];
				ArrayList<HomeworkBoardFile> fileInfos = new ArrayList<HomeworkBoardFile>(size);
				String rfilename = null;
				String sfilename = null;
				int index = 0;
				for(MultipartFile file : fileup) {
					rfilename = file.getOriginalFilename();
					sfilename = String.format("%d%s", System.currentTimeMillis(), rfilename);
					fileInfos.add(new HomeworkBoardFile(rfilename, sfilename));
					String fileName = String.format("%s/%s", dir, sfilename);
					files[index] = new File(fileName);
					file.transferTo(files[index++]);
				}
				if (fileInfos != null) {
					dao.addFiles(fileInfos, bno);
				}
			}
			
			

		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 작성 중 오류 발생");
		}
	}

	@Override
	public void update(HomeworkBoard board) {
		try {
			dao.update(board);

		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 수정 중 오류 발생");
		}
	}

	@Override
	public void remove(int no) {
		try {
			dao.removeFiles(no);
			dao.remove(no);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 삭제 중 오류 발생");
		}
	}

	@Override
	public HomeworkBoard search(int no) {
		try {
			HomeworkBoard board = dao.search(no);
			List<HomeworkBoardReply> replys = dao.selectReplys(no);
			board.setReplys(replys);;
			return board;
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 검색 중 오류 발생");
		}
	}

	@Override
	public List<HomeworkBoard> searchAll(PageBean bean) {
		try {
			int total = dao.getCount(bean);

			PageUtility bar = new PageUtility(bean.getInterval(), total,
					bean.getPageNo(), "images/");
			System.out.println(bar);
			bean.setPagelink(bar.getPageBar());
			System.out.println(bar.getPageBar());
			return dao.searchAll(bean);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 검색 중 오류 발생");
		}
	}

	@Override
	public void addReplys(HomeworkBoardReply replys, int no) {
		try {
			replys.setNo(no);
			dao.addReply(replys);
		} catch(Exception e) {
			e.printStackTrace();
			throw new UpdateException("댓글 작성 중 오류 발생");
		}
	}

}
