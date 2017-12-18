package com.gbj.mapper;

import java.util.List;
import java.util.Map;

import com.gbj.model.Menu;

public interface MenuMapper {
    List<Menu> queryHaveMenu(Integer role_id);
    List<Menu> queryNotHaveMenu(Integer role_id);
    int delMenu(Map<String , Object> map);
    int mdiMenu(Map<String , Object> map);
}
