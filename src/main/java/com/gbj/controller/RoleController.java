package com.gbj.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gbj.model.Role;
import com.gbj.service.RoleService;
import com.gbj.utils.PageBean;

@Controller
public class RoleController {
    @Autowired
    private RoleService roleService;
    @RequestMapping("/roleList")
    public String roleList(Map<String , Object> map,Role role,@RequestParam(required=false,defaultValue="1")Integer pages,HttpServletRequest request){
        map = PageBean.serverMap(map , role , pages);
        map = roleService.roleList(map);
        map = PageBean.clientMap(map , pages , request);
        return "role/roleList";
    }
}
