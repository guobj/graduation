package com.gbj.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.gbj.model.Employee;
import com.gbj.service.PersonalService;
import com.gbj.utils.FileUpload;
import com.google.gson.Gson;

@Controller
public class PersonalController {
    @Autowired
    private PersonalService personalService;
    //查询个人资料
    @RequestMapping("/personalInfo")
    public String personalInfo(Employee employee,Map<String , Object> map,HttpServletRequest request){
        HttpSession session = request.getSession();
        employee = (Employee) session.getAttribute("employee");
        map.put("emp_id" ,employee.getEmp_id());
        try{
            personalService.load(map);
        }catch(Exception e){
            // TODO: handle exception
        }
        return "person/personalInfo";
    }
    //提交保存修改的个人信息
    @RequestMapping("/personalUpdate.action")
    public String personalUpdateAction(Map<String , Object> map,Employee employee){
        try{
            map.put("employee" , employee);
            personalService.employeeUpdateAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "person/success";

    }
    //修改密码
    @RequestMapping("/passwordMdi")
    public String password(Employee employee,Map<String , Object> map,HttpServletRequest request){
        HttpSession session = request.getSession();
        employee = (Employee) session.getAttribute("employee");
        map.put("emp_id" ,employee.getEmp_id());
        return "person/passwordMdi";
    }
    //查询原密码通过session
    @RequestMapping("/queryPsdBySession")
    public void queryPsdBySession(Employee employee,Map<String , Object> map,HttpServletRequest request,HttpServletResponse response){
        try{
            HttpSession session = request.getSession();
            employee = (Employee) session.getAttribute("employee");
            Gson gson = new Gson();
            String data = gson.toJson(employee);
            System.out.println(data);
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print(data);
            out.flush();
            out.close();
        }catch(Exception e){
            // TODO: handle exception
            e.getMessage();
        }
    }
    //修改密码
    @RequestMapping("passwordMdi.action")
    public String passwordMdiAction(Employee employee,Map<String , Object> map,HttpServletRequest request){
        try{
            HttpSession session = request.getSession();
            map.put("employee" , employee);
            personalService.passwordMdi(map);
            session.invalidate();
            return "login/login";
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
            return "person/passwordMdi";
        }
    }
    //修改头像
    @RequestMapping("logoUpdate")
    public String logoUpdate(Employee employee,Map<String , Object> map,HttpServletRequest request){
        HttpSession session = request.getSession();
        employee = (Employee) session.getAttribute("employee");
        map.put("emp_id" ,employee.getEmp_id());
        try{
            personalService.load(map);
        }catch(Exception e){
            // TODO: handle exception
        }
        return "person/logoUpdate";
    }
    //提交保存修改的个人信息
    @RequestMapping("/logoUpdate.action")
    public String logoUpdateAction(Map<String , Object> map,Employee employee,MultipartFile file){
        try{
            String name = FileUpload.fileUpload(file);
            employee.setEmp_logo(name);
            map.put("employee" , employee);
            personalService.employeeUpdateAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "person/logo";

    }
}
