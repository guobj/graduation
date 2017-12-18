package com.gbj.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gbj.service.MenuService;

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
    @RequestMapping("/updateMenu")
    public String updateMenu(Map<String , Object> map,Integer role_id,Integer[] selectR){
        map.put("menu_ids" , selectR);
        map.put("role_id" , role_id);
        map = menuService.updateMenu(map);
        return "main/message";
    }
}
