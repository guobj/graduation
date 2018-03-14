package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.Employee;
import com.gbj.model.Menu;

public interface EmployeeMapper {
	//员工登陆及权限分配
	public Employee login(Map<String, Object> map);

	public List<Menu> sonMenuList(Integer role_id);

	public List<Menu> fatherMenuList(Integer[] father_menu);

	//员工查询及基本操作
	//员工模糊查询及分页
	public List<Employee> employeeList(Map<String, Object> map);

	public int count(Map<String, Object> map);

	//添加用户
	public int employeeAddAction(Employee employee);

	//修改用户信息
	public Employee load(Integer emp_id);

	public int employeeUpdateAction(Employee employee);

	//逻辑删除
	public int employeeDelAction(Integer emp_id);

	//逻辑删除多条数据
	public int employeeMoreDelAction(Integer[] emp_ids);

	//离职员工模糊查询及分页
	public List<Employee> employeeNotList(Map<String, Object> map);

	public int countNot(Map<String, Object> map);

	//恢复离职员工职位
	public int employeeRecAction(Integer emp_id);

	//查询所有在职员工
	public List<Employee> findAllList();

	//修改密码
	public int passwordMdi(Employee employee);

	//批量删除离职员工不可恢复
	public int employeeNotMoreDelAction(Integer[] emp_ids);
}
