package com.atguigu.crowdfunding.cpes.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.atguigu.crowdfunding.cpes.bean.Role;
import com.atguigu.crowdfunding.cpes.bean.User;
import com.atguigu.crowdfunding.cpes.service.RoleService;
import com.atguigu.crowdfunding.cpes.service.UserService;
import com.atguigu.crowdfunding.utils.Const;
import com.atguigu.crowdfunding.utils.MD5Util;
import com.atguigu.crowdfunding.utils.StringUtil;

@Controller
@RequestMapping("/system/user")
public class UserController extends BaseController {
	
	private Font mFont = new Font("Times New Roman", Font.BOLD, 24);

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	
	//用户添加所有角色
	@ResponseBody
	@RequestMapping("/unAssignAll")
	public Object unAssignAll(Integer id){
		begin();
		try {
			userService.removeAllUserRoleRelation(id);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("取消分配角色失败");
		}
		return end();
	}
	
	//用户添加所有角色
	@ResponseBody
	@RequestMapping("/unAssignRole")
	public Object unAssignRole(Integer id,Datas data){
		begin();
		try {
			userService.removeUserRoleRelation(id,data);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("取消分配角色失败");
		}
		return end();
	}

	//用户添加所有角色
	@ResponseBody
	@RequestMapping("/assignAll")
	public Object assignAll(Integer id){
		begin();
		try {
			userService.addAllUserRoleRelation(id);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("分配角色失败");
		}
		return end();
	}
	
	//用户添加角色
	@ResponseBody
	@RequestMapping("/assignRole")
	public Object assignRole(Integer id,Datas datas){
		begin();
		try {
			userService.addUserRoleRelation(id,datas);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("分配角色失败");
		}
		return end();
	}
	
	//去用户分配角色页面
	@RequestMapping("/role/{id}")
	public String role(@PathVariable("id")Integer userid,Model model){
		User user = userService.select(userid);
		model.addAttribute("user",user);
		
		//查询所有的角色数据
		List<Role> rs = roleService.selectAll();
		model.addAttribute("rs",rs);
		
		//查询已经分配的数据
		List<Integer> ars = userService.selectUserRoleById(userid);
		model.addAttribute("ars",ars);
		
		return "user/assign";
	}
	
	//修改用户信息
	@ResponseBody
	@RequestMapping("/update")
	public Object update(User user){
		begin();
		try {
			userService.update(user);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("删除用户失败");
		}
		return end();
	}
	
	//去编辑用户的页面
	@RequestMapping("/edit/{id}")
	public String toupdate(@PathVariable("id")Integer userid,Model model){
		User user = userService.select(userid);
		model.addAttribute("user",user);
		return "user/edit";
	}
	
	//删除用户
	@ResponseBody
	@RequestMapping("/deletes")
	public Object deletes(Datas datas){
		begin();
		try {
			userService.deletes(datas);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("删除用户失败");
		}
		return end();
	}
	
	//新增用户
	@ResponseBody
	@RequestMapping("/insert")
	public Object add(User user){
		begin();
		try {
			userService.insert(user);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("新增用户失败");
		}
		return end();
	}
	
	//跳转到新增用户页面
	@RequestMapping("/add")
	public String toAdd(){
		return "user/add";
	}
	
	@ResponseBody
	@RequestMapping("/datas")
	public Object datas(Integer start, @RequestParam("length")Integer pageSize, Integer draw){
		Page<User> users = userService.getUserPage(start,pageSize);
		users.setDraw(draw);
		return users;
	}
	
	//跳转到用户分配角色主页
	@RequestMapping("/index")
	public String toIndex(){
		return "user/index";
	}
	
	//用户登录
	@RequestMapping("/login")
	@ResponseBody
	public Object login(User user,HttpSession session,String authcode){
		begin();
		String sessIcon = (String) session.getAttribute(Const.SESS_ICON);
		if (authcode==null||"".equals(authcode)) {
			error("验证码为空,请输入验证码！");
		} else {
			session.removeAttribute(Const.SESS_ICON);
			if (!authcode.equals(sessIcon)) {
				error("验证码错误，请重新输入！");
			} else {
				User dbUser = userService.queryUser(user.getLoginacct());
				if(dbUser == null){
					error("用户账号不存在。请重新输入!");
				} else {
					String digest = MD5Util.digest(user.getUserpswd());
					if(dbUser.getUserpswd().equals(digest)){
						success();
						session.setAttribute(Const.USER_LOGIN, dbUser);
					} else {
						error("账号/密码不正确，请重新输入！");
					}
				}
			}
		}
		return end();
	}
	
	//验证码
	@RequestMapping("/verify")
	public void webverify( HttpServletResponse response, Integer r1, HttpSession session ) throws Exception {
		response.setHeader("Pragma","No-cache");
		response.setHeader("Cache-Control","no-cache");
		response.setDateHeader("Expires", 0);
		
		response.setContentType("image/png");
		
		int width  = 100;
		int height = 40;
		
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		
		Graphics g = image.getGraphics();
		
		String color = "#59B0FF";
		if ( StringUtil.isNotEmpty(color) ) {
			g.setColor(new Color(Integer.parseInt(color.substring(1, 3), 16),Integer.parseInt(color.substring(3, 5), 16),Integer.parseInt(color.substring(5, 7), 16)));	
		} else {
			g.setColor(new Color(50,118,177));
		}
		
		g.fillRect(1, 1, width-1, height-1);
		//66D178
		//g.setColor(new Color(204,204,204));
		g.setColor(new Color(77,170,255));
		g.drawRect(0, 0, width-1, height-1);
		g.setFont(mFont);
		g.setColor(new Color(255,255,255));
		
		String content = "";
		int i = r1;
		
		int i1 = new Random().nextInt(10);
		
		content = i + " + " + i1 + " = ? ";
		
		g.drawString(content, 10, 25);
		session.setAttribute(Const.SESS_ICON, ""+(i+i1));
		g.dispose();
		ImageIO.write(image, "PNG", response.getOutputStream());
	}
}
