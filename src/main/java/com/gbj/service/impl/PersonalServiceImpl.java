package com.gbj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbj.mapper.DepartmentMapper;
import com.gbj.mapper.EducationMapper;
import com.gbj.mapper.EmployeeMapper;
import com.gbj.mapper.RoleMapper;
import com.gbj.model.Department;
import com.gbj.model.Education;
import com.gbj.model.Employee;
import com.gbj.model.Role;
import com.gbj.service.PersonalService;
@Service
public class PersonalServiceImpl implements PersonalService {
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private EducationMapper educationMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Override
    public Employee load(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        Employee employee = employeeMapper.load(Integer.parseInt( map.get("emp_id").toString()));
        List<Role> roleEmpList = roleMapper.roleEmpList(map);
        List<Education> eduList = educationMapper.eduList();
        List<Department> depList = departmentMapper.depList();
        map.put("depList" , depList);
        map.put("eduList" , eduList);
        map.put("roleEmpList" , roleEmpList);
        if(employee!=null){
            map.put("employee" , employee);
            return employee;
        }else{
            throw new RuntimeException("没有数据");
        }

    }
    @Override
    public int employeeUpdateAction(Map<String , Object> map ) {
        //保存修改的客户信息
        // TODO Auto-generated method stub
        Employee employee = (Employee) map.get("employee");
        int result = employeeMapper.employeeUpdateAction(employee);
        if(result>0){
            map.put("message" , "保存成功");
            return result;
        }else{
            throw new RuntimeException("保存失败");
        }
    }
    //修改密码
    @Override
    public int passwordMdi(Map<String , Object> map ) {
        // TODO Auto-generated method stub
        Employee employee = (Employee) map.get("employee");
        int result = employeeMapper.passwordMdi(employee);
        System.out.println("result="+result);
        if(result>0){
            map.put("message" , "密码已重置。请重新登录");
            return result;
        }else{
            throw new RuntimeException("修改失败");
        }
    }

}
