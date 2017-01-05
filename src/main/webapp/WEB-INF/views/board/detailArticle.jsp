<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="vo" value="${articleVO}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<table>
		<tr>
			<th>글번호</th>
			<td>${vo.article_no}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.article_user_id}</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td>${vo.article_title}</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td>${vo.article_content}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${vo.article_creation_date}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${vo.article_readcount}</td>
		</tr>
	</table>
	
	<a href="delete">삭제</a>
	<a href="modify">수정</a>
	<a href="../">목록으로</a>
	
</body>
</html>