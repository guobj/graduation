package com.gbj.service;

import com.gbj.model.Employee;

import java.util.List;
import java.util.Map;

public interface EmployeeService {
	public Map<String, Object> login(Map<String, Object> map);

	/*public Map<String , Object> sonMenuList(Map<String , Object> map);
	public Map<String , Object> fatherMenuList(Map<String , Object> map);*/
	//员工模糊查询及分页
	public Map<String, Object> employeeList(Map<String, Object> map);

	//添加新用户
	public Map<String, Object> employeeAdd(Map<String, Object> map);

	public int employeeAddAction(Map<String, Object> map);

	//通过ID查询将要修改用户
	public Map<String, Object> load(Map<String, Object> map, Integer emp_id);

	//提交保存修改的客户信息
	public int employeeUpdateAction(Map<String, Object> map);

	//逻辑删除用户
	public Employee employeeDelAction(Integer emp_id);

	//逻辑删除多个用户
	public List employeeMoreDelAction(Integer[] emp_ids);

	//离职员工模糊查询及分页
	public Map<String, Object> employeeNotList(Map<String, Object> map);

	//恢复离职员工职位、
	public Employee employeeRecAction(Integer emp_id);

	//逻辑删除多个用户
	public List employeeNotMoreDelAction(Integer[] emp_ids);

	//验证账号是否存在
	public Employee isAccount(String account);
}
