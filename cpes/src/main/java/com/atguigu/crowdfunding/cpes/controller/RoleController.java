package com.atguigu.crowdfunding.cpes.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.crowdfunding.bean.Datas;
import com.atguigu.crowdfunding.bean.Page;
import com.atguigu.crowdfunding.controller.BaseController;
import com.atguigu.crowdfunding.cpes.bean.Permission;
import com.atguigu.crowdfunding.cpes.bean.Role;
import com.atguigu.crowdfunding.cpes.bean.RolePermission;
import com.atguigu.crowdfunding.cpes.service.PermissionService;
import com.atguigu.crowdfunding.cpes.service.RoleService;

@Controller
@RequestMapping("/system/role")
public class RoleController extends BaseController {

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private PermissionService permissionService;
	
	@RequestMapping("/assign")
	@ResponseBody
	public Object assign( Datas datas, Integer roleid){
		begin();
		try {
			roleService.assignPermission(datas,roleid);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("角色分配失败！");
		}
		return end();
	}
	
	@RequestMapping("/tree")
	@ResponseBody
	public Object tree( Integer roleid ){
		List<Permission> superPs = new ArrayList<Permission>();
		Map<Integer, Permission> pMap = new HashMap<Integer, Permission>();

		List<Permission> ps = permissionService.getAll();
		
		// 查询角色已经分配的许可信息
		List<RolePermission> assignps = roleService.queryAssignedPermission(roleid);
		
		for (Permission p : ps) {
			pMap.put(p.getId(), p);
		}
		for (RolePermission rp : assignps) {
			Permission node = pMap.get(rp.getPermissionid());
			node.setChecked(true);
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
	
	@RequestMapping("/permissionTree/{rid}")
	public String permissionTree(@PathVariable("rid")Integer roleid,
					Model model){
		model.addAttribute("roleid",roleid);
		return "role/tree";
	}
	
	@RequestMapping("/deletes")
	@ResponseBody
	public Object deletes(Datas data){
		begin();
		try {
			roleService.deletes(data);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("删除角色信息失败！");
		}
		return end();
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Object update(Role role){
		begin();
		try {
			roleService.update(role);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("修改角色信息失败！");
		}
		return end();
	}
	
	@RequestMapping("/edit/{id}")
	public String toEdit(@PathVariable("id")Integer id, Model model){
		Role role = roleService.selectByPrimary(id);
		model.addAttribute("role",role);
		model.addAttribute("id",id);
		return "role/edit";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(Role role){
		begin();
		try {
			roleService.insert(role);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("保存角色信息失败！");
		}
		return end();
	}
	
	@RequestMapping("/datas")
	@ResponseBody
	public Object datas(Integer start, @RequestParam("length")Integer pageSize, Integer draw){
		Page<Role> roles = roleService.getPageRole(start,pageSize);
		roles.setDraw(draw);
		return roles;
	}
	
	@RequestMapping("/index")
	public String toRole() {
		return "role/index";
	}
	
	@RequestMapping("/add")
	public Object toadd(){
		return "role/add";
	}
}
