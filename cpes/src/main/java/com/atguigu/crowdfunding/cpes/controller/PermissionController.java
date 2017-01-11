package com.atguigu.crowdfunding.cpes.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.crowdfunding.controller.BaseController;
import com.atguigu.crowdfunding.cpes.bean.Permission;
import com.atguigu.crowdfunding.cpes.service.PermissionService;

@Controller
@RequestMapping("/system/permission")
public class PermissionController extends BaseController{

	@Autowired
	private PermissionService permissionService;
	
	@ResponseBody
	@RequestMapping("/delete")
	public Object delete(Integer id){
		begin();
		try {
			permissionService.delete(id);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("删除失败!");
		}
		return end();
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Object update(Permission p){
		begin();
		try{
			permissionService.update(p);
			success();
		}catch( Exception e ){
			e.printStackTrace();
			error("修改异常，请重新操作");
		}
		return end();
	}
	
	@RequestMapping("/edit")
	public String edit(Integer id,Model model){
		Permission p = permissionService.selectByPrimary(id);
		model.addAttribute("p", p);
		return "permission/edit";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Object save(Permission p){
		begin();
		try{
			permissionService.save(p);
			success();
		}catch( Exception e ){
			e.printStackTrace();
			error("保存异常，请重新操作");
		}
		return end();
	}
	
	@RequestMapping("/add")
	public String add(){
		return "permission/add";
	}
	
	@RequestMapping("/index")
	public String permission(){
		return "permission/index";
	}
	
	@RequestMapping("/tree")
	@ResponseBody
	public Object tree(){
		List<Permission> superPs = new ArrayList<Permission>();

		List<Permission> ps = permissionService.getAll();
		
		Map<Integer, Permission> pMap = new HashMap<Integer, Permission>();
		for (Permission p : ps) {
			pMap.put(p.getId(), p);
		}
		for (Permission p : ps) {
			Integer pid = p.getPid();
			if (pid==0){
				superPs.add(p);
			} else {
				pMap.get(pid).getChildren().add(p);
			}
		}
		
		return superPs;
	}
	
	
	
}
