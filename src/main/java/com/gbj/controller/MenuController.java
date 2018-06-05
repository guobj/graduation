package com.gbj.controller;

import com.gbj.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class MenuController {
    @Autowired
    private MenuService menuService;
    @RequestMapping("/mdiMenu")
    public String mdiMenu(Integer role_id,Map<String , Object> map){
        map = menuService.queryMenu(role_id , map);
        map.put("role_id" , role_id);
        return "menu/mdiMenu";
    }
    //分配权限
    @RequestMapping("/updateMenu")
    public String updateMenu(Map<String , Object> map,Integer role_id,Integer[] selectR){
        map.put("menu_ids" , selectR);
        map.put("role_id" , role_id);
        map = menuService.updateMenu(map);
        return "main/message";
    }
}
