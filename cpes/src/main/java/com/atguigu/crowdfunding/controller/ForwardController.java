package com.atguigu.crowdfunding.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.crowdfunding.cpes.bean.Permission;
import com.atguigu.crowdfunding.cpes.bean.User;
import com.atguigu.crowdfunding.cpes.service.UserService;
import com.atguigu.crowdfunding.utils.Const;

@Controller
@RequestMapping("/")
public class ForwardController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/sign")
	public String toSign(){
		return "sign";
	}
	
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	
	@RequestMapping("/system/login")
	public String toLogin(){
		return "login";
	}
	
	@RequestMapping("/system/main")
	public String main( HttpSession session, Model model ){
		Permission root = null;
		User user = (User) session.getAttribute(Const.USER_LOGIN);
		List<Permission> ps = userService.getPermissions(user.getId());
		
		Map<Integer, Permission> pMap = new HashMap<Integer, Permission>();
		for (Permission p : ps) {
			pMap.put(p.getId(), p);
		}
		for (Permission p : ps) {
			Integer pid = p.getPid();
			if (pid==0){
				root = p;
			} else {
				pMap.get(pid).getChildren().add(p);
			}
		}
		
		model.addAttribute("ps",root);
		
		return "main";
	}
	
}
