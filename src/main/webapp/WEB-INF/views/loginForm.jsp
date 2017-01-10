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
        	if(!username||!password) {
        		alert("ID/PW입력해주세요");
        		return false;
        	}
        	
        	try {
        		var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
        		var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
        		submitEncryptedForm(username,password,rsaPublicKeyModulus,rsaPublicKeyExponent);
        	} catch (err) {
        		alert(err);
        	}
        	return false;
        }
        
        function submitEncryptedForm(username, password, rsaPublicKeyModulus, rsaPublicKeyExponent) {
        	var rsa = new RSAKey();
        	rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
        	
        	var securedUsername = rsa.encrypt(username);
        	var securedPassword = rsa.encrypt(password);
        	
        	var securedLoginForm = document.getElementById("securedLoginForm");
        	securedLoginForm.securedUsername.value = securedUsername;
        	securedLoginForm.securedPassword.value = securedPassword;
        	securedLoginForm.submit();
        	
        }
        </script>
</head>
<body>
	<div>
		<label for="username">사용자ID: <input type="text" id="username" size="16" /> </label>
		<label for="password">비밀번호 : <input type="password" id="password" size="16" /></label>
		<input type="hidden" id="rsaPublicKeyModulus" value="<%=request.getAttribute("publicKeyModulus")%>" />
		<input type="hidden" id="rsaPublicKeyExponent" value="<%=request.getAttribute("publicKeyExponent")%>" />
		<a href="<%=request.getContextPath()%>/loginFailure.jsp" onclick="validateEncryptedForm();return false;">로그인</a>
	</div>
	        <form id="securedLoginForm" name="securedLoginForm" action="<%=request.getContextPath()%>/login/" method="post" style="display: none;">
            <input type="hidden" name="securedUsername" id="securedUsername" value="" />
            <input type="hidden" name="securedPassword" id="securedPassword" value="" />
        </form>
    </body>
		
</body>
</html>