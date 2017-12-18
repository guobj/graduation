package com.gbj.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {
    
    @Override
    public boolean preHandle(HttpServletRequest request , HttpServletResponse response , Object handler )
            throws Exception {
        // TODO Auto-generated method stub
        HttpSession session = request.getSession();
        if(session.getAttribute("employee")==null){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.write("<script>"
                    + "alert('请登录');"
                    + "window.top.location.href='"+request.getContextPath()+"/login';"
                    + "</script>");
            out.flush();
            out.close();
            return false;
        }
        return true;
    }

}
