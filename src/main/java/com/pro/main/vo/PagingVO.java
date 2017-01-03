package com.pro.main.vo;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;

import com.pro.main.board.BoardService;

public class PagingVO implements Serializable{
	
	@Autowired
	private BoardService boardService;

	private int viewCount = 10;
	private int countPage = 10;

	
	private int pg;
	
	
	
	//int totalPage = totalCount / viewCount;
	
	
	
	
	
}
