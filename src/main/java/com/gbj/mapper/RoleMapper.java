package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.Role;

public interface RoleMapper {
    public Map<String , Object> load(Integer role_id);
    public List<Role> roleList(Map<String , Object> map);
    public int count(Map<String , Object> map);
    public List<Role> roleEmpList(Map<String , Object> map);
}
