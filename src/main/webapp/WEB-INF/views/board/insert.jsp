<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../../../../resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.min.js" ></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(function() {
	$('#btnOK').click(function() {
		editors[0].exec('UPDATE_CONTENTS_FIELD',[]);
		$('#myForm').submit();
	});
});

</script>
</head>
<body>
<div>
	<form method="post" id="myForm" action="" enctype="multipart/form-data">
	<input type="file" name="file" id="file" /><br/>
	<h4>WRITE ARTICLE</h4>
		<c:if test="${userNumber eq '0'}">
			<input type="text" placeholder="이름을 입력해주세요. " name="username" id="username"/><br/>
			<input type="password" placeholder="비밀번호" name="userpw" id="userpw"/><br/>
		</c:if>
		<c:if test="${userNumber ne '0'}">${uinfo.member_id}<br/></c:if>


	<input type="text" id="subject" name="subject" autofocus="autofocus" required="required" placeholder="제목"/><br/>
		<textarea rows="10" cols="100" name="content" id="content"></textarea><br/>
		<script>
			var editors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef:editors,
				elPlaceHolder:'content',
				sSkinURI:'../../../../resources/smarteditor/SmartEditor2Skin.html',
				fCreator:'Julius',
				htParams : {
	            bUseToolbar : true,             
	            bUseVerticalResizer : false,     
	            bUseModeChanger : true, 
		        }
			});
		</script>
		<input type="button" value="WRITE" id="btnOK"/>
		<input type="button" value="Cancel" onclick="javascript:history.back();"/>
</div>
	
	
</form>
</body>
</html>