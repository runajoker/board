package com.pro.main;

import java.io.IOException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Cipher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pro.main.board.BoardService;
import com.pro.main.vo.ArticleVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private BoardService boardService;

	private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
		logger.info("will decrypt:" +securedValue);
		Cipher cipher = Cipher.getInstance("RSA");
		byte[] encryptedBytes = hexToByteArray(securedValue);
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
		String decrypteValue = new String(decryptedBytes, "utf-8");//문자 인코딩 주의
		logger.info("decrypteBytes:" +decryptedBytes);
		
		
		return decrypteValue;
		
	}
	
	public static byte[] hexToByteArray(String hex) {
		if(hex == null || hex.length() %2 != 0) {
			return new byte[]{};
		}
		
		byte[] bytes = new byte[hex.length() / 2];
		for(int i=0;i<hex.length();i+=2) {
			byte value = (byte) Integer.parseInt(hex.substring(i, i+2), 16);
			bytes[(int) Math.floor(i / 2)] = value;
		}
		return bytes;
	}
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {

		List<ArticleVO> list = boardService.getBoardNew4Article();

		return new ModelAndView("index", "list", list);
	}

	@RequestMapping(value = "/login/", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
			KeyFactory keyFactory = null;
			generator.initialize(1024);
			KeyPair keyPair = generator.genKeyPair();
			keyFactory = KeyFactory.getInstance("RSA");
			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();

			HttpSession session = request.getSession();
			session.setAttribute("__rsaPrivateKey__", privateKey);
			RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

			request.setAttribute("publicKeyModulus", publicKeyModulus);
			request.setAttribute("publicKeyExponent", publicKeyExponent);

			
			request.getRequestDispatcher("/WEB-INF/views/loginForm.jsp").forward(request, response);
			//request.getRequestDispatcher("loginForm").forward(request, response);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeySpecException e2) {
			e2.printStackTrace();
		}
		return new ModelAndView("loginForm");
	}

	@RequestMapping(value = "/login/", method = RequestMethod.POST)
	public ModelAndView loginCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException {

		String securedUsername = request.getParameter("securedUsername");
		String securedPassword = request.getParameter("securedPassword");
		
		HttpSession session = request.getSession();
		PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
		session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막기위해 강제로 없애버린다
		
		if(privateKey == null) {
			throw new RuntimeException("암호화 비밀 키 정보를 찾을 수 없습니다.");
		} 
		try {
			String username = decryptRsa(privateKey, securedUsername);
			String password = decryptRsa(privateKey, securedPassword);
			logger.info("original username:" +username);
			logger.info("originnal password:" +password);
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
			return new ModelAndView("login"); 
			//request.getRequestDispatcher("login").forward(request, response);
			
		} catch(Exception e) {
			throw new ServletException(e.getMessage(), e);
			
		}
	}
	
	
	@RequestMapping(value = "/hello/", method = RequestMethod.GET)
	public String hello() {

		return "loginForm";
	}
	
	@RequestMapping(value = "/regist/", method = RequestMethod.GET)
	public void moveRegistView(HttpServletRequest request, HttpServletResponse response) {
		try {
			KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
			KeyFactory keyFactory = null;
			generator.initialize(1024);
			KeyPair keyPair = generator.genKeyPair();
			keyFactory = KeyFactory.getInstance("RSA");
			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();

			HttpSession session = request.getSession();
			session.setAttribute("__rsaPrivateKey__", privateKey);
			RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

			request.setAttribute("publicKeyModulus", publicKeyModulus);
			request.setAttribute("publicKeyExponent", publicKeyExponent);

			
			try {
				request.getRequestDispatcher("/WEB-INF/views/regist.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//request.getRequestDispatcher("loginForm").forward(request, response);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeySpecException e2) {
			e2.printStackTrace();
		}
	}
	
	
	@RequestMapping(value = "/regist/", method = RequestMethod.POST)
	public void registCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException {

		String securedId = request.getParameter("securedUsername");
		String securedPassword = request.getParameter("securedPassword");
		String securedEmail = request.getParameter("securedEmail");
		String username = request.getParameter("hiddenUsername");
		HttpSession session = request.getSession();
		PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
		session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막기위해 강제로 없애버린다
		
		if(privateKey == null) {
			throw new RuntimeException("암호화 비밀 키 정보를 찾을 수 없습니다.");
		} 
		try {
			String id = decryptRsa(privateKey, securedId);
			String password = decryptRsa(privateKey, securedPassword);
			//일단은 password 2에 관한것도 만들어 놓긴 했는데 조금 더 공부후 보완 해야함
			String email = decryptRsa(privateKey, securedEmail);
			/*logger.info("original id:" +id);
			logger.info("originnal password:" +password);
			logger.info("originnal email:" + email);
			logger.info("username: "+ username);*/
/*			request.setAttribute("username", id);
			request.setAttribute("password", password);
			request.setAttribute("email", email);*/
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("userId", id);
			map.put("userPw", password);
			map.put("email", email);
			map.put("username", username);
			
			logger.info("mapUserId : "+map.get("userId"));
			logger.info("mapUserPw : "+map.get("userPw"));
			logger.info("mapEmail : "+map.get("email"));
			logger.info("mapUsername : "+map.get("username"));
			//boardService.registUser();
			
			
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
			//request.getRequestDispatcher("login").forward(request, response);
			
		} catch(Exception e) {
			throw new ServletException(e.getMessage(), e);
			
		}
	}
	
}
