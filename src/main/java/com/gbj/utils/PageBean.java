package com.gbj.utils;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class PageBean {
    public static Map<String , Object> serverMap(Map<String , Object> map,Object obj,Integer pages){
        //获取obj的类名
        String t = obj.getClass().getSimpleName();
        //System.out.println(obj.getClass().getName());
        //将类名全部转为小写
        String type = t.toLowerCase();
        map.put(type , obj);
        map.put("record" , (pages-1)*4);
        return map;
    }
    public static Map<String , Object> clientMap(Map<String , Object> map,Integer pages,HttpServletRequest request){
        int count = Integer.parseInt(map.get("count").toString());
        int sumPage = (count%4==0)?(count/4):(count/4+1);
        map.put("pages" , pages);
        map.put("sumPage" , sumPage);
        map.put("url" , request.getServletPath());
        return map;
    }
}
