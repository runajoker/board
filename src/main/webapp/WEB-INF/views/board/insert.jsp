<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../../../../resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.min.js" ></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var oEditors = []; 
$(function(){ 
	nhn.husky.EZCreator.createInIFrame({ 
		oAppRef: oEditors, 
		elPlaceHolder: "content", 
		//SmartEditor2Skin.html 파일이 존재하는 경로 
		sSkinURI: "../../../../resources/editor/SmartEditor2Skin.html",	
		fCreator:'runajoker',
		htParams : { 
		// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseToolbar : true,	
		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseVerticalResizer : true,	
		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseModeChanger : true
		}
	});
});

$(function() {
	$('#btnOk').click(function(){ 
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []); 
		$('#myform').submit(); 
	});
});
		
	
</script>
</head>
<body>
<div>
	<form method="post" id="myform" action="" >
	<!-- <input type="file" name="file" id="file" /><br/> -->
	<h4>WRITE ARTICLE</h4>
		<c:if test="${userNumber eq '0'}">
			<input type="text" placeholder="이름을 입력해주세요. " name="username" id="username"/><br/>
			<input type="password" placeholder="비밀번호" name="userpw" id="userpw"/><br/>
		</c:if>
		<c:if test="${userNumber ne '0'}">${uinfo.member_id}<br/></c:if>


	<input type="text" id="subject" name="subject" autofocus="autofocus" required="required" placeholder="제목"/><br/>
		<textarea rows="10" cols="100" name="content" id="content"></textarea><br/>

		<input type="button" value="WRITE" id="btnOk"/>
		<input type="button" value="Cancel" onclick="javascript:history.back();"/>
		</form>
</div>
	


	

</body>
</html>