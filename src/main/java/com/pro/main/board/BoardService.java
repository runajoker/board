package com.pro.main.board;

import java.util.List;
import java.util.Map;

import com.pro.main.vo.ArticleVO;

public interface BoardService {

	List<ArticleVO> getBoardList(Map<String, Integer> args);

	int getTotalCountArticle(int board_no);

	ArticleVO getDetailArticle(Map<String, Integer> args);

	void increaseViewCount(int article_no);


}
