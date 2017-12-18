package com.gbj.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gbj.model.Employee;
import com.gbj.service.EmployeeService;
import com.gbj.utils.FileUpload;
import com.gbj.utils.PageBean;
import com.gbj.utils.TimeDemo;

@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    //员工的模糊查询及分页
    @RequestMapping("/empsList")
    public String employeeList(Map<String , Object> map,Employee employee,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        map = PageBean.serverMap(map , employee , pages);
        map = employeeService.employeeList(map);
        map = PageBean.clientMap(map , pages , request);
        return "employee/employeeList";
    }
    //弹出添加信息框
    @RequestMapping("/employeeAdd")
    public String employeeAdd(Map<String , Object> map){
        map = employeeService.employeeAdd(map);
        return "employee/employeeAdd";
    }
    //提交并v保存添加的用户
    @RequestMapping("/employeeAdd.action")
    public String employeeAddAction(Map<String , Object> map,Employee employee,MultipartFile file) throws IllegalStateException, IOException{
        //生成创建客户的时间
        String time = TimeDemo.dateTime();
        employee.setEmp_time(time);
        //上传用户头像
        String name = FileUpload.fileUpload(file);
        employee.setEmp_logo(name);
        map.put("employee" , employee);
        try{
            employeeService.employeeAddAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //弹出将要修改用户的信息
    @RequestMapping("/employeeUpdate")
    public String employeeUpdate(Map<String , Object> map,Integer emp_id){
        map = employeeService.load(map , emp_id);
        return "employee/employeeUpdate";
    }
    //提交保存修改的用户信息信息
    @RequestMapping("/employeeUpdate.action")
    public String employeeUpdateAction(Map<String , Object> map,Employee employee,MultipartFile file){
        try{
            //上传用户头像
            String name = FileUpload.fileUpload(file);
            employee.setEmp_logo(name);
            map.put("employee" , employee);
            employeeService.employeeUpdateAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
        
    }
    //弹出删除信息框
    @RequestMapping("/employeeDel")
    public String employeeDel(Map<String , Object> map, Integer id){
        map.put("id" , id);
        map.put("url" , "employeeDel.action");
        return "main/del";
    }
    //通过ID删除该用户的信息，，，逻辑删除
    @RequestMapping("/employeeDel.action")
    public String employeeDelAction(Map<String , Object> map, Integer id){
        try{
            map.put("emp_id" , id);
            employeeService.employeeDelAction(map,id);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //通过map进行的批量删除，用户ID存到数组中去
    @RequestMapping("/employeeMoreDel.action")
    public String employeeMoreDelAction(Map<String , Object> map,Integer[] emp_ids){
        try{
            map.put("emp_ids" , emp_ids);
            employeeService.employeeMoreDelAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    //离职员工的模糊查询及分页
    @RequestMapping("/empsNotList")
    public String employeeNotList(Map<String , Object> map,Employee employee,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        map = PageBean.serverMap(map , employee , pages);
        map = employeeService.employeeNotList(map);
        map = PageBean.clientMap(map , pages , request);
        return "employee/employeeNotList";
    }
    //弹出确认恢复信息框
    @RequestMapping("/employeeRec")
    public String employeeRec(Map<String , Object> map, Integer emp_id){
        map.put("emp_id" , emp_id);
        return "employee/employeeRec";
    }
    //通过ID恢复该用户的职位，，，逻辑恢复
    @RequestMapping("/employeeRec.action")
    public String employeeRecAction(Map<String , Object> map, Integer emp_id){
        try{
            map.put("emp_id" , emp_id);
            employeeService.employeeRecAction(map);
        }catch(Exception e){
            // TODO: handle exception
            map.put("message" , e.getMessage());
        }
        return "main/message";
    }
    
}
