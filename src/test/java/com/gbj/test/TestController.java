package com.gbj.test;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@Controller
public class TestController {

	 	@RequestMapping("/result")
	    public String provinceList(Map<String , Object> map,HttpServletResponse response) throws UnknownHostException{
	 		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
					.getRequest();
	 		InetAddress address = InetAddress.getLocalHost();
	 		String ip = request.getHeader("x-forwarded-for");  
//	 		 String ip = request.getHeader("x-forwarded-for");  
	         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	             ip = request.getHeader("Proxy-Client-IP");  
	         }  
	         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	             ip = request.getHeader("WL-Proxy-Client-IP");  
	         }  
	         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	             ip = request.getHeader("HTTP_CLIENT_IP");  
	         }  
	         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	             ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
	         }  
	         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	             ip = request.getRemoteAddr();  
	         }  
	 		//String ip = request.getRemoteAddr();
	 		RestTemplate restTemplate = new RestTemplate();
	 		StringBuilder url = new StringBuilder("http://api.map.baidu.com/location/ip?ip=");
	 		url.append("123.103.9.7");
	 		url.append("&ak=9KxefSDZBHk9bLd8EStr5mqCMeVvtpf5&coor=bd09ll");
	 		String getResult = restTemplate.getForObject(url.toString(),String.class);
	 		JsonObject urlReturnData = new JsonParser().parse(getResult).getAsJsonObject();
	 		JsonObject content = (JsonObject)urlReturnData.get("content");
	 		JsonObject point = (JsonObject)content.get("point");
	 		String x = point.get("x").getAsString();
	 		String y = point.get("y").getAsString();
	 		Double x1 = Double.parseDouble(x);
	 		Double y1 = Double.parseDouble(y);
	 		
	 		
	 		StringBuilder detailsUrl = new StringBuilder("http://api.map.baidu.com/geocoder/v2/?location=");
	 		detailsUrl.append(y1 + "," + x1);
	 		detailsUrl.append("&output=json&pois=0&ak=9KxefSDZBHk9bLd8EStr5mqCMeVvtpf5");
	 		String detailsGetResult = restTemplate.getForObject(detailsUrl.toString(),String.class);
	 		JsonObject detailsUrlReturnData = new JsonParser().parse(detailsGetResult).getAsJsonObject();
	 		JsonObject result = (JsonObject)detailsUrlReturnData.get("result");
	 		JsonObject addressComponent = (JsonObject)result.get("addressComponent");
	 		String province = addressComponent.get("province").getAsString();
	 		String district = addressComponent.get("district").getAsString();
	 		String city = addressComponent.get("city").getAsString();
	 		//JsonObject returnData = new JsonParser().parse(getResult).getAsJsonObject();
	 		System.out.println(province+district+city);
	 		//System.out.println(y1);
	 		map.put("x1", x1);
	 		map.put("y1", y1);
	 		System.out.println(y1);
	 		System.out.println(ip);
	 		return "test/index";
	 		}
	 		//测试
}
