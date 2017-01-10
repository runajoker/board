package com.pro.main.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.main.vo.ArticleVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
		
	@Override
	public List<ArticleVO> getBoardList(Map<String, Integer> args) {
		return boardDAO.getBoardList(args);
	}

	@Override
	public int getTotalCountArticle(int board_no) {
		return boardDAO.getTotalCountArticle(board_no);
	}

	@Override
	public ArticleVO getDetailArticle(Map<String, Integer> args) {
		return boardDAO.getDetailArticle(args);
	}

	@Override
	public void increaseViewCount(int article_no) {
		boardDAO.increaseViewCount(article_no);
	}

	@Override
	public List<ArticleVO> getBoardNew4Article() {
		return boardDAO.getBoardNew4Article();
	}

	@Override
	public void deleteArticle(int article_no) {
		boardDAO.deleteArticle(article_no);
	}

	@Override
	public void createArticle(ArticleVO articleVO) {
		boardDAO.createArticle(articleVO);
	}

}
