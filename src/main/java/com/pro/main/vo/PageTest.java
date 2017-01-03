package com.pro.main.vo;
import java.util.Scanner;

public class PageTest {

	public static void main(String[] args) {
		//Scanner sc = new Scanner(System.in);
		//int totalcount = sc.nextInt();
		int totalcount = 602;
		int pageViewCount = 15;
		int countPage = 10;
		int pg = 61;
		
		
		int totalPage = totalcount/countPage ;
		//if(totalcount % countPage > 0) 이렇게 될 경우 혹시라도 -값이 들어가게 되면 페이지가 하나 늘어난다
		if(totalcount % countPage > 0) {
			totalPage++;
		}
		
		int startNum = ((pg-1) / countPage) * countPage +1;
		
		//int endNum = ((pg-1)/countPage) * countPage + 10;
		int endNum = startNum + countPage + -1;

		if(endNum > totalPage) {
			endNum = totalPage;
		}
		
		System.out.println("TotalPage: "+totalPage+"StartNum"+startNum+"//"+endNum);
		
		System.out.print("<");
		for(int i= startNum; i<=endNum;i++) {
			System.out.print("["+i+"]");
		}
		System.out.print(">");
	}
	//totalPage complete
	
	
	
}
