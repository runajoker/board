package com.pro.main.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pro.main.vo.ArticleVO;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/board")
	public ModelAndView boardGo() {
		
		List<ArticleVO> list = boardService.getBoardList();
		for(ArticleVO avo:list) {
			logger.info(avo.toString());
			
		}
		
		
		return new ModelAndView("/board/board","list",list);
	}
	
}
