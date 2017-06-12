package com.hexacore.ssy.sharing.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

public class Encoding {
	public static String encodingKeyword(String keyword){
		if(keyword == null || keyword.trim().length() == 0){
			return "";
		}
		
		try{
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
		
	}
	
}
