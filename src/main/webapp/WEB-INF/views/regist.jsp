<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../resources/assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<title>Insert title here</title>
        <script type="text/javascript" src="../resources/js/rsa/jsbn.js"></script>
        <script type="text/javascript" src="../resources/js/rsa/rsa.js"></script>
        <script type="text/javascript" src="../resources/js/rsa/prng4.js"></script>
        <script type="text/javascript" src="../resources/js/rsa/rng.js"></script>
        <script>
        function validateEncryptedForm() {
        	var username = document.getElementById("username").value;
        	var password = document.getElementById("password").value;
        	var password2 = document.getElementById("password2").value;
        	var email = document.getElementById("email").value;
        	if(!username||!password||!email) {
        		alert("ID/PW/email을 입력해주세요");
        		return false;
        	}
        	
        	if(password != password2) {
        		alert("비밀번호가 동일하지 않습니다.");
        		return false;
        	}
        	try {
        		var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
        		var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
        		submitEncryptedForm(username,password, email,rsaPublicKeyModulus,rsaPublicKeyExponent);
        	} catch (err) {
        		alert(err);
        	}
        	return false;
        }
        
        function submitEncryptedForm(username, password, email,rsaPublicKeyModulus, rsaPublicKeyExponent) {
        	var rsa = new RSAKey();
        	rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
        	
        	var securedUsername = rsa.encrypt(username);
        	var securedPassword = rsa.encrypt(password);
        	var securedEmail = rsa.encrypt(email);
        	
        	var securedRegistForm = document.getElementById("securedRegistForm");
        	securedRegistForm.securedUsername.value = securedUsername;
        	securedRegistForm.securedPassword.value = securedPassword;
        	securedRegistForm.securedEmail.value = securedEmail;
        	securedRegistForm.hiddenUsername.value = document.getElementById("name").value;
        	securedRegistForm.submit();
        	
        }
        </script>
</head>
<body>
	<!-- Header -->
		<div id="header">

			<!-- Logo -->
			<h1>
				<a href="/main" id="logo">HoonHoon's HomePage</a>
			</h1>

			<!-- Nav -->
			<nav id="nav">
			<ul>
				<!-- <li class="current"><a href="/main">Home</a></li> -->
				<li><a href="#">Dropdown</a>
					<ul>
						<li><a href="#">주인 소개</a></li>
						<li><a href="#">Magna phasellus</a></li>
						<li><a href="#">Etiam sed tempus</a></li>
						<li><a href="#">Submenu</a>
							<ul>
								<li><a href="#">Lorem dolor</a></li>
								<li><a href="#">Phasellus magna</a></li>
								<li><a href="#">Magna phasellus</a></li>
								<li><a href="#">Etiam nisl</a></li>
								<li><a href="#">Veroeros feugiat</a></li>
							</ul></li>
						<li><a href="#">Veroeros feugiat</a></li>
					</ul></li>
				<li><a href="../../../board/1/1/">자유 게시판</a></li>
				<li><a href="/blog/">블로그</a></li>
				<li class="current"><a href="/main/regist/">regist</a></li>
			</ul>
			</nav>

		</div>


	<div style="position: relative;left: 33%; width:50%;">
		<div id="content">

						<!-- Content -->

						
						<h2>회원가입</h2>
		</div>
		<label for="username"><input type="text" class="regist" id="username" size="16" placeholder="아이디" style="width:50%" /> </label> <br/>
		<label for="password"><input type="password"  class="regist" id="password" size="16" placeholder="비밀번호" style="width:50%" /></label> <br/>
		<label for="password2"><input type="password"  class="regist" id="password2" size="16" placeholder="비밀번호 확인" style="width:50%" /></label> <br/>
		<label for="name"><input type="text" id="name"  class="regist" size="16" placeholder="이름" style="width:50%"/> </label> <br/>
		<label for="email"><input type="text" id="email"  class="regist" size="16" placeholder="이메일" style="width:50%"/></label> <br/>
		<input type="hidden" id="rsaPublicKeyModulus" value="<%=request.getAttribute("publicKeyModulus")%>" />
		<input type="hidden" id="rsaPublicKeyExponent" value="<%=request.getAttribute("publicKeyExponent")%>" />
		<a href="<%=request.getContextPath()%>/loginFailure.jsp" onclick="validateEncryptedForm();return false;">가입하기</a>
	</div>
	        <form id="securedRegistForm" name="securedRegistForm" action="<%=request.getContextPath()%>/regist/" method="post" style="display: none;">
            <input type="hidden" name="securedUsername" id="securedUsername" value="" />
            <input type="hidden" name="securedPassword" id="securedPassword" value="" />
            <input type="hidden" name="securedEmail" id="securedEmail" value="" />
            <input type="hidden" name="hiddenUsername" id="hiddenUsername" value="" />
        </form>
        
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
			<script src="../resources/assets/js/jquery.min.js"></script>
			<script src="../resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="../resources/assets/js/skel.min.js"></script>
			<script src="../resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="../resources/assets/js/main.js"></script>
    </body>
		
</body>
</html>