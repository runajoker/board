package com.pro.main.vo;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.pro.main.board.BoardService;

@Component
@Scope("prototype")
public class PagingVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private BoardService boardService;

	public String getPagingNumbers(int pg, int board_no) throws Exception{

		int totalCount = boardService.getTotalCountArticle(board_no);
		int pageViewCount = 15;
		int countPage = 10;

		int totalPage = totalCount / pageViewCount;
		// if(totalcount % countPage > 0) 이렇게 될 경우 혹시라도 -값이 들어가게 되면 페이지가 하나 늘어난다
		if (totalCount % pageViewCount > 0) {
			totalPage++;
		}

		StringBuffer sb = new StringBuffer();
		int startNum = ((pg - 1) / countPage) * countPage + 1;

		// int endNum = ((pg-1)/countPage) * countPage + 10;
		int endNum = startNum + countPage + -1;

		if (endNum > totalPage) {
			endNum = totalPage;
		}

		System.out.println("TotalPage: " + totalPage + "StartNum" + startNum + "//" + endNum);

		System.out.print("<");
		if(pg > 10) {
		sb.append("<a href='/main/board/1/"+(startNum-1)+"/'><</a>");
		}
		else {
			//sb.append("<a href='/main/board/1/"+1+"'><</a>");
		}
		
		for (int i = startNum; i <= endNum; i++) {
			if(i == pg) {
			sb.append(" <a href='/main/board/1/"+i+"/'><b>"+i+"</b></> ");
			} else {
			sb.append(" <a href='/main/board/1/"+i+"/'>"+i+"</> ");
			}
		}
		if(endNum < totalPage) {
			sb.append("<a href='/main/board/1/"+(endNum+1)+"/'>></a>");	
		}
		
		return sb.toString();
	}

}
