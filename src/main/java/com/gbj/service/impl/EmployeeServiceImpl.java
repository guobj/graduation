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
import com.gbj.model.Menu;
import com.gbj.model.Role;
import com.gbj.service.EmployeeService;
@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private EducationMapper educationMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Override
    public Map<String , Object> login(Map<String , Object> map ) {
        //获得账号和密码
        Employee emp = (Employee) map.get("employee");
        //与数据库匹配账号密码
        Employee employee = employeeMapper.login(map);
        map.put("employee" , employee);
        if(employee!=null){
            if(employee.getFk_role_id()!=null){
                //通过外键查询子菜单
                List<Menu> sonMenuList = employeeMapper.sonMenuList(employee.getFk_role_id());
                map.put("sonMenuList" , sonMenuList);
                if(sonMenuList!=null&&sonMenuList.size()>0){
                    //通过子菜单的外键获取父菜单的ID并返回数组
                    Integer[] father_menus = new Integer[sonMenuList.size()];
                    for(int i=0;i<sonMenuList.size();i++){
                        father_menus[i] = sonMenuList.get(i).getFather_menu();
                    }
                    //查询父菜单名称
                    List<Menu> fatherMenuList = employeeMapper.fatherMenuList(father_menus);
                    map.put("fatherMenuList" , fatherMenuList);
                }
                return map;
            }else{

                throw new RuntimeException("用户名或密码错误");
            }
        }else{

            throw new RuntimeException("用户名或密码错误");
        }

    }
    //员工模糊查询及分页
    @Override
    public Map<String , Object> employeeList(Map<String , Object> map ) {
        List<Employee> employeeList = employeeMapper.employeeList(map);
        int count = employeeMapper.count(map);
        if(employeeList!=null&&employeeList.size()>0){
            map.put("employeeList" , employeeList);
            map.put("count" , count);
            return  map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    //添加新用户
    //查询相关信息
    @Override
    public Map<String , Object> employeeAdd(Map<String , Object> map ) {
        List<Role> roleEmpList = roleMapper.roleEmpList(map);
        List<Education> eduList = educationMapper.eduList();
        List<Department> depList = departmentMapper.depList();
        map.put("depList" , depList);
        map.put("eduList" , eduList);
        map.put("roleEmpList" , roleEmpList);
        return map;
    }
    @Override
    public int employeeAddAction(Map<String , Object> map ) {
        Employee employee = (Employee) map.get("employee");
        int result = employeeMapper.employeeAddAction(employee);
        if(result>0){
            map.put("message" , "添加成功");
            return result;
        }else{
            throw new RuntimeException("添加失败");
        }
    }
    //查询要修改用户的信息ByID
    @Override
    public Map<String , Object> load(Map<String , Object> map , Integer emp_id ) {
        List<Role> roleEmpList = roleMapper.roleEmpList(map);
        List<Education> eduList = educationMapper.eduList();
        List<Department> depList = departmentMapper.depList();
        map.put("depList" , depList);
        map.put("eduList" , eduList);
        map.put("roleEmpList" , roleEmpList);
        map.put("employeeMap" , employeeMapper.load(emp_id));
        return map;
    }
    //保存修改的客户信息
    @Override
    public int employeeUpdateAction(Map<String , Object> map ) {
        Employee employee = (Employee) map.get("employee");
        int result = employeeMapper.employeeUpdateAction(employee);
        if(result>0){
            map.put("message" , "修改成功");
            return result;
        }else{
            throw new RuntimeException("修改失败");
        }
    }
    //逻辑删除一条数据ByID
    @Override
    public Employee employeeDelAction(Integer emp_id ) {
        Employee employee = employeeMapper.load(emp_id);
        int result = employeeMapper.employeeDelAction(emp_id);
        if(result>0){
            return employee;
        }else{
            throw new RuntimeException("删除失败");
        }
    }
    //逻辑删除多条数据ByIDs
    @Override
    public List employeeMoreDelAction(Integer[] emp_ids ) {
        List<?> employeeList= employeeMapper.findAllList();
        int result = employeeMapper.employeeMoreDelAction(emp_ids);
        if(result>0){
            return employeeList;
        }else{
            throw new RuntimeException("删除失败");
        }
    }
    @Override
    public Map<String , Object> employeeNotList(Map<String , Object> map ) {
        List<Employee> employeeNotList = employeeMapper.employeeNotList(map);
        int count = employeeMapper.countNot(map);
        if(employeeNotList!=null&&employeeNotList.size()>0){
            map.put("employeeNotList" , employeeNotList);
            map.put("count" , count);
            return  map;
        }else{
            throw new RuntimeException("没有数据");
        }
    }
    @Override
    public Employee employeeRecAction(Integer emp_id ) {
        Employee employee = employeeMapper.load(emp_id);
        int result = employeeMapper.employeeRecAction(emp_id);
        if(result>0){
            return employee;
        }else{
            throw new RuntimeException("恢复失败");
        }
    }

    @Override
    public List employeeNotMoreDelAction(Integer[] emp_ids) {
        List<?> employeeList= employeeMapper.findAllList();
        int result = employeeMapper.employeeNotMoreDelAction(emp_ids);
        if(result>0){
            return employeeList;
        }else{
            throw new RuntimeException("删除失败");
        }
    }
}
