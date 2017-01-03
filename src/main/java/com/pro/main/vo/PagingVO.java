package com.pro.main.vo;

import java.io.Serializable;

public class PagingVO implements Serializable{
	
	int totalCount = 30;
	int viewCount = 10;
	int countPage = 10;
	int pg;
	
	int totalPage = totalCount / viewCount;
	
	
	
	
	
}
