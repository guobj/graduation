package com.gbj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    //    @RequestMapping("")
	@RequestMapping("/error")
	public String error(){
		return "main/404";
	}
}
