package com.util;
import java.util.Random;

public class StringUtils {
	
	
	private final static String EMPTY_SYMBOL = "-";
	/**
	 * @param psStr
	 * @return
	 */
	public static boolean isEmpty(String psStr){
		if(psStr == null || "".equals(psStr)){
			return true;
		}
		
		return false;
	}
	
	/**
	 * @param psStr
	 * @return
	 */
	public static boolean isNotEmpty(String psStr){
		if(psStr != null && !"".equals(psStr) && !"null".equals(psStr)){
			return true;
		}
		
		return false;
	}
	
	/**
	 * @param piLength
	 * @return
	 */
	public static String getRandom(Integer piLength){
		String random = "";
		Random rand = new Random();
		for (int i = 0; i < piLength; i++) {
			random = random + rand.nextInt(10);
		}
		return random;
	}
	
	/**
	 * 格式化str
	 * @param psStr
	 * @return
	 */
	public static String escapeNull(String psStr){
		return psStr == null || psStr.equals("")?EMPTY_SYMBOL:psStr;
	}
	
	/**
	 * 格式化str
	 * @param psStr
	 * @return
	 */
	public static String escapeNull(Integer piInt){
		return piInt == null ?EMPTY_SYMBOL:piInt.toString();
	}
	
	public static String array2String(String [] pasStr,String psSplit){
		if(pasStr == null || pasStr.length == 0){
			return "";
		}
		
		StringBuffer sb = new StringBuffer();
		for(String str: pasStr){
			sb.append(str);
			sb.append(psSplit);
		}
		return sb.substring(0,sb.length()-1);
	}
	
	/**
	 * 
	 * @param str    ",,,,,,"   "5,3,,4,,,5"
	 * @return
	 */
	public static String trimString(String str){
		String temp = "";
		for(String strTemp : str.split(",")){
			if(StringUtils.isNotEmpty(strTemp) && !"null".equals(strTemp)){
				if("".equals(temp)){
					temp = strTemp ;
				}else{
					temp += "," + strTemp;
				}
			}
		}
		return temp ;
	}
	
	public static void main(String args[]){
		System.out.println(StringUtils.trimString("5,3,,4,,,5,"));
		System.out.println(StringUtils.trimString(",,,,,,"));
	}
}
