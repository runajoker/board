<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/main/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : 'content',
			//SmartEditor2Skin.html 파일이 존재하는 경로 
			sSkinURI : '/main/resources/smarteditor/SmartEditor2Skin.html',
			fCreator : 'SangHoon',
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseModeChanger : true
			}
		});

		//전송버튼
		$('#save').click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			oEditors.getById['content'].exec('UPDATE_CONTENTS_FIELD', []);
			//폼 submit
			$('#myForm').submit();
		})
	})
</script>
</head>
<body>
<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="/main" id="logo">HoonHoon's HomePage</a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<!-- <li class="current"><a href="/main">Home</a></li> -->
								<li>
									<a href="#">Dropdown</a>
									<ul>
										<li><a href="#">주인 소개</a></li>
										<li><a href="#">Magna phasellus</a></li>
										<li><a href="#">Etiam sed tempus</a></li>
										<li>
											<a href="#">Submenu</a>
											<ul>
												<li><a href="#">Lorem dolor</a></li>
												<li><a href="#">Phasellus magna</a></li>
												<li><a href="#">Magna phasellus</a></li>
												<li><a href="#">Etiam nisl</a></li>
												<li><a href="#">Veroeros feugiat</a></li>
											</ul>
										</li>
										<li><a href="#">Veroeros feugiat</a></li>
									</ul>
								</li>
								<li><a href="board/1/1/">자유게시판</a></li>
								<li><a href="blog/">블로그</a></li>
								<li>
									<a href="login/">회원</a>
									<ul>
										<li><a href="regist/">회원가입</a></li>
										<li><a href="login/">로그인</a></li>
									</ul>
								</li>
								<c:if test="${userNumber eq '0'}"><li>${userNumber}비회원${session.userNumber}</a></li></c:if>
								<c:if test="${userNumber ne '0'}"><li>${userNumber}회원${uinfo.member_no}</a></li></c:if>
							</ul>
						</nav>

				</div>
	<div>
		<form method="post" id="myForm" action=""
			enctype="multipart/form-data">
			<h4>WRITE ARTICLE</h4>
			<c:if test="${userNumber eq '0'}">
				<input type="text" placeholder="이름을 입력해주세요. " name="username"
					id="username" />
				<br />
				<input type="password" placeholder="비밀번호" name="userpw" id="userpw" />
				<br />
			</c:if>
			<c:if test="${userNumber ne '0'}">${uinfo.member_id}<br />
			</c:if>


			<input type="text" id="subject" name="subject" autofocus="autofocus"
				required="required" placeholder="제목" /><br />
			<textarea rows="10" cols="100" name="content" id="content" style="width:766px; height:412px; display:none;"></textarea>

			<br /> <input type="button" value="WRITE" id="save" /> <input
				type="button" value="Cancel" onclick="javascript:history.back();" />



		</form>
	</div>
				<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">
						
						
						</div>
					</div>

					<!-- Icons -->
						<ul class="icons">
							<li><a href="https://twitter.com/kj7310" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="https://www.facebook.com/sanghoon.kim.35" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="https://github.com/runajoker" class="icon fa-github"><span class="label">GitHub</span></a></li>
						</ul>

					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>

				</div>

		</div>

		<!-- Scripts -->
			<script src="../../../../resources/assets/js/jquery.min.js"></script>
			<script src="../../../../resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="../../../../resources/assets/js/skel.min.js"></script>
			<script src="../../../../resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="../../../../resources/assets/js/main.js"></script>
</body>
</html>