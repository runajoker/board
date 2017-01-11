package com.pro.main.vo;

import java.security.PrivateKey;

import javax.crypto.Cipher;

import org.slf4j.LoggerFactory;

public class RsaMethod {

	private org.slf4j.Logger logger = LoggerFactory.getLogger(RsaMethod.class);

	public String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
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
}
