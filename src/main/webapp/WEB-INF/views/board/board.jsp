<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pg}" var="page" />
<c:set value="${paging}" var="num" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>

		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td>${vo.article_no}</td>
				<td><a href="${vo.article_no}/">${vo.article_title}</a></td>
				<td>${vo.article_user_id}</td>
				<td>${vo.article_creation_date}</td>
				<td>${vo.article_readcount}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="paging">
	${num}
	</div>
</body>
</html>