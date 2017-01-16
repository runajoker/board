<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../../../../resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "../../../../resources/smarteditor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});
</script>

</script>
</head>
<body>
	
		<form method="post" action="">
			<c:if test="${userNumber eq '0'}">
			<input type="text" placeholder="이름을 입력해주세요. " name="username" id="username"/><br/>
			<input type="password" placeholder="비밀번호" name="userpw" id="userpw"/><br/>
			</c:if>
			<c:if test="${userNumber ne '0'}">${uinfo.member_id}<br/></c:if>
		<input type="text" placeholder="제목을 입력해주세요. " name="subject" id="subject"/><br/>
		<textarea name="ir1" id="ir1" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
		
		<textarea rows="10" cols="100" name="content" id="content">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea><br/>
		<input type="submit" value="완료"/>
		</form>
	
</body>
</html>