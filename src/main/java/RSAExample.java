import java.security.InvalidKeyException;
import java.security.Key;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.security.Security;
 
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
 
public class RSAExample {
    public static void main(String[] args) throws NoSuchAlgorithmException, NoSuchProviderException,
            NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
 
        Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
        //addProvider가 없으면 에러가 난다
        byte[] input = "ggad7310".getBytes();
        // NoSuchAlgorithmException, NoSuchProviderException,
        // NoSuchPaddingException
        Cipher cipher = Cipher.getInstance("RSA/None/NoPadding", "BC");
        
        SecureRandom random = new SecureRandom();
        KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA", "BC");
 
        generator.initialize(128, random);// 여기선 128bit key 생성
        KeyPair pair = generator.generateKeyPair();
        Key pubicKey = (Key) pair.getPublic();// publicKey cast 안하면 eclipse에서 밑줄
                                                // 에러남
        Key privateKey = (Key) pair.getPrivate();// privateKey Private보다 Key가
                                                    // Down
 
        // 공개 키를 전달하여 암호화
        // InvalidKeyException
        cipher.init(Cipher.ENCRYPT_MODE, pubicKey);
        // IllegalBlockSizeException
        byte[] cipherText = cipher.doFinal(input);
        System.out.println("cipher : (" + cipherText.length + ")" + new String(cipherText));
 
        // 개인 키를 가지고있는 쪽에서 복호화
        cipher.init(Cipher.DECRYPT_MODE, (java.security.Key) privateKey);
        byte[] plainText = cipher.doFinal(cipherText);
        System.out.println("plain : " + new String(plainText));
 
    }
 
}
