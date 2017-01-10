package com.pro.main.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pro.main.vo.ArticleVO;
import com.pro.main.vo.PagingVO;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private PagingVO pagingVO;
	
	@RequestMapping(value = "/board/{board_no}/{pg}/")
	public ModelAndView boardGo(@PathVariable int pg, @PathVariable int board_no) throws Exception {
		Map<String , Integer> args = new HashMap<String , Integer>();
		args.put("board_no", board_no);
		int pageLimit = (pg - 1) * 15 ;
		args.put("pg", pageLimit);
		String paging = pagingVO.getPagingNumbers(pg, board_no);
		
		List<ArticleVO> list = boardService.getBoardList(args);
		
		ModelAndView mav = new ModelAndView("/board/board","list",list);
		mav.addObject("pg",pg);
		mav.addObject("paging",paging);
		return mav;
	}
	
	@RequestMapping(value = "/board/{board_no}/{pg}/{article_no}/")
	public ModelAndView detailArticleShow(@PathVariable int board_no ,@PathVariable int article_no, @PathVariable int pg) {
		boardService.increaseViewCount(article_no);
		
		logger.info(article_no+""+board_no);
		Map<String, Integer> args = new HashMap<String, Integer>();
		args.put("board_no", board_no);
		args.put("article_no", article_no);
		ArticleVO articleVO = boardService.getDetailArticle(args);  
		logger.info(articleVO.toString());
		ModelAndView mav = new ModelAndView("/board/detailArticle","articleVO",articleVO);
		mav.addObject("pg",pg);
		return mav;
	}
	
	@RequestMapping(value = "/board/{board_no}/{pg}/{article_no}/delete/")
	public ModelAndView deleteArticle(@PathVariable int article_no) {
		try {
			boardService.deleteArticle(article_no);
			
		} catch (NullPointerException e) {
			e.printStackTrace();
			//세션이 같은게 아니면 삭제 안되게
		}
		
		ModelAndView mav = new ModelAndView("result");
		mav.addObject("msg","삭제 성공");
		mav.addObject("url","../../");
		
		return mav;
		
	}
	
	@RequestMapping(value = "/board/{board_no}/{pg}/create/", method = RequestMethod.GET)
	public String moveWriteForm(HttpSession session) {

		return "/board/insert";
	}

	@RequestMapping(value = "/board/{board_no}/{pg}/create/", method = RequestMethod.POST)
	public ModelAndView createArticle(@PathVariable int board_no, HttpSession session, HttpServletRequest request) {
		
		logger.info(request.getParameter("subject"));
		logger.info(request.getParameter("username"));
		logger.info(request.getParameter("userpw"));
		logger.info(request.getParameter("content"));
		ArticleVO articleVO = new ArticleVO();
		articleVO.setArticle_title(request.getParameter("subject"));
		articleVO.setArticle_user_id(request.getParameter("username"));
		articleVO.setArticle_user_password(request.getParameter("userpw"));
		articleVO.setArticle_content(request.getParameter("content"));
		articleVO.setBoard_no(board_no);
		
		boardService.createArticle(articleVO);
		logger.info(board_no+"");
		
		return new ModelAndView("redirect:../");
	}
}
