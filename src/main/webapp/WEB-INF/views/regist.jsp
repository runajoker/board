<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/rsa/jsbn.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/rsa/rsa.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/rsa/prng4.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/rsa/rng.js"></script>
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
	<div>
		<label for="username">사용자ID: <input type="text" id="username" size="16" /> </label> <br/>
		<label for="password">비밀번호 : <input type="password" id="password" size="16" /></label> <br/>
		<label for="password2">비밀번호 : <input type="password" id="password2" size="16" /></label> <br/>
		<label for="name">이름 : <input type="text" id="name" size="16" /> </label> <br/>
		<label for="email">이메일: <input type="text" id="email" size="16" /></label> <br/>
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
    </body>
		
</body>
</html>