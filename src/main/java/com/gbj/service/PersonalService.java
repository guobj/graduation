package com.gbj.service;

import java.util.Map;

import com.gbj.model.Employee;

public interface PersonalService {
    public Employee load(Map<String , Object> map);
    //提交保存修改的个人信息信息
    public int employeeUpdateAction(Map<String , Object> map);
    //修改密码
    public int passwordMdi(Map<String , Object> map);
}
