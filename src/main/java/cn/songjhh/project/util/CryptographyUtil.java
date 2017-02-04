package cn.songjhh.project.util;

import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * Created by song9 on 2016/12/30.
 */
public class CryptographyUtil {

    //Base64加密
    public static String encBase64(String str) {
        return Base64.encodeToString(str.getBytes());
    }

    //Base64解密
    public static String decBase64(String str) {
        return Base64.decodeToString(str);
    }

    //Md5加密
    public static String md5(String str,String salt) {
        return new Md5Hash(str,salt).toString();
    }

}
