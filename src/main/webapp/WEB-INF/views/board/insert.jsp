<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<form method="post" action="">
			<c:if test="${userNumber eq '0'}">
			<input type="text" placeholder="이름을 입력해주세요. " name="username" id="username"/><br/>
			<input type="password" placeholder="비밀번호" name="userpw" id="userpw"/><br/>
			</c:if>
			<c:if test="${userNumber ne '0'}">${uinfo.member_id}<br/></c:if>
		<input type="text" placeholder="제목을 입력해주세요. " name="subject" id="subject"/><br/>
		<textarea rows="30" cols="30" name="content" id="content"></textarea><br/>
		<input type="submit" value="완료"/>
		</form>
	
</body>
</html>