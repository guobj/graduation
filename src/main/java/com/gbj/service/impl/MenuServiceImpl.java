package com.gbj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gbj.mapper.MenuMapper;
import com.gbj.model.Menu;
import com.gbj.service.MenuService;
@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;
    @Override
    public Map<String , Object> queryMenu(Integer role_id ,Map<String , Object> map) {
        // TODO Auto-generated method stub
        List<Menu> haveList = menuMapper.queryHaveMenu(role_id);
        List<Menu> notList = menuMapper.queryNotHaveMenu(role_id);
        map.put("notList" , notList);
        map.put("haveList" , haveList);
        return map;
    }

    @Override
    public Map<String , Object> updateMenu(Map<String , Object> map) {
        // TODO Auto-generated method stub
        menuMapper.delMenu(map);
        Integer[] menu_ids = (Integer[]) map.get("menu_ids");
        if(menu_ids!=null&&menu_ids.length>0){
            menuMapper.mdiMenu(map);
        }
        map.put("message" , "分配成功");
        return map;
    }
    
    
    
}
