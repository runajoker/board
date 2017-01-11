package com.pro.main.board;

import java.util.List;
import java.util.Map;

import com.pro.main.vo.ArticleVO;

public interface BoardService {

	List<ArticleVO> getBoardList(Map<String, Integer> args);

	int getTotalCountArticle(int board_no);

	ArticleVO getDetailArticle(Map<String, Integer> args);

	void increaseViewCount(int article_no);

	List<ArticleVO> getBoardNew4Article();

	void deleteArticle(int article_no);

	void createArticle(ArticleVO articleVO);

	ArticleVO modifyStepOneArticleRead(int member_no);

	void modifyStepTwoArticleModify(ArticleVO articleVO);


}
