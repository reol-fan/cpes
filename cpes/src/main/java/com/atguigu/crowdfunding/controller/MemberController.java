package com.atguigu.crowdfunding.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.atguigu.crowdfunding.bean.Member;
import com.atguigu.crowdfunding.bean.MemberCertimgCount;
import com.atguigu.crowdfunding.bean.Ticket;
import com.atguigu.crowdfunding.cpes.bean.CertImg;
import com.atguigu.crowdfunding.service.MemberService;
import com.atguigu.crowdfunding.service.TicketService;
import com.atguigu.crowdfunding.utils.Const;
import com.atguigu.crowdfunding.utils.MD5Util;
import com.atguigu.crowdfunding.utils.NumberUtil;

@Controller
@RequestMapping("/member")
public class MemberController extends BaseController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private RepositoryService repositoryService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping("/logout")
	public String logout( HttpSession session){
		session.removeAttribute(Const.MEMBER_LOGIN);
		return "/index";
	}
	
	@RequestMapping("/finishcert")
	public String finishcert(){
		return "member/finishcert";
	}
	
	@ResponseBody
	@RequestMapping("/checkcode")
	public Object checkcode(String authcode,HttpSession session){
		begin();
		try {
			Member loginMember = (Member) session.getAttribute(Const.MEMBER_LOGIN);
			if (loginMember == null) {
				error("请先登录再操作！");
			}else{
				Ticket ticket = ticketService.queryTicketByMember(loginMember);
				
				if(ticket.getAuthcode().equals(authcode)){
					Task task = taskService.createTaskQuery().processInstanceId(ticket.getPiid()).taskAssignee(""+ticket.getMemberid()).singleResult();
					taskService.complete(task.getId());
					ticket.setStatus("1");
					ticketService.updateStatus(ticket);
					success();
				} else {
					error("认证码不正确，请重新输入！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			error("系统打小差了，请重新认证！");
		}
		return end();
	}
	
	@RequestMapping("/donate-5")
	public String donate5(){
		return "member/donate-5";
	}
	
	@RequestMapping("/donate-4")
	public String donate4(){
		return "member/donate-4";
	}
	
	@ResponseBody
	@RequestMapping("/uptEmail")
	public Object uptEmail(String email, HttpSession session){
		begin();
		try {
			Member loginMember = (Member) session.getAttribute(Const.MEMBER_LOGIN);
			loginMember.setEmail(email);
			memberService.updateEmail(loginMember);
			ProcessDefinition pd = repositoryService.createProcessDefinitionQuery().processDefinitionKey("cpes").latestVersion().singleResult();
			Map<String,Object> varMap = new HashMap<String,Object>();
			varMap.put("emailto", email);
			varMap.put("memberid",""+loginMember.getId());
			String authcode = NumberUtil.getRandomNum(6);
			varMap.put("emailcontent", "实名认证申请认证码：" + authcode 
					+ "\n\r前往认证页面认证：http://www.crowdfunding.com/member/donate-5.htm");
			ProcessInstance pi = runtimeService.startProcessInstanceById(pd.getId(),varMap);
			
			Ticket ticket = new Ticket(loginMember.getId(), pi.getId(), "0", authcode);
			ticketService.insert(ticket);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("邮箱验证失败！");
		}
		return end();
	}
	
	@RequestMapping("/donate-3")
	public String donate3(){
		return "member/donate-3";
	}
	
	@ResponseBody
	@RequestMapping("/uploadImg")
	public Object uploadImg( HttpServletRequest request){
		begin();
		try {
			MultipartRequest mr = (MultipartRequest) request;
			HttpSession session = request.getSession();
			ServletContext sc = session.getServletContext();
			Member loginMember = (Member) session.getAttribute(Const.MEMBER_LOGIN);
			Iterator<String> names = mr.getFileNames();
			
			List<MemberCertimgCount> accCertShip = new ArrayList<>();
			
			while (names.hasNext()) {
				String name = names.next();
				String[] ss = name.split("-");
				MultipartFile file = mr.getFile(name);
				String fname = file.getOriginalFilename();
				String fileName = System.currentTimeMillis()+fname.substring(fname.indexOf("."));
				accCertShip.add(new MemberCertimgCount(null, loginMember.getId(), Integer.parseInt(ss[1]), fileName));
				//保存文件
				String imgpath = sc.getRealPath("/memberimgs");
				InputStream in = file.getInputStream();
				FileOutputStream out = new FileOutputStream(imgpath+"/"+fileName);
				
				int i = -1;
				while((i = in.read()) !=-1)
					out.write(i);
				out.close();
			}
			
			memberService.insertCertImgs(accCertShip);
			
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("上传证件失败");
		}
		return end();
	}
	
	@RequestMapping("/donate-2")
	public String donate2(HttpSession session,Model model){
		Member member = (Member) session.getAttribute(Const.MEMBER_LOGIN);
		
		//查询会员需要提交的资质数据
		List<CertImg> cis = memberService.queryCertimgByAcctype(member);
		model.addAttribute("cis",cis);
		return "member/donate-2";
	}
	
	@ResponseBody
	@RequestMapping("/uptinfo")
	public Object uptinfo(Member member,HttpSession session){
		begin();
		try {
			Member loginMember = (Member) session.getAttribute(Const.MEMBER_LOGIN);
			loginMember.setCardno(member.getCardno());
			if (member.getAcctype()==null) member.setAcctype(loginMember.getAcctype());
			else loginMember.setAcctype(member.getAcctype());
			loginMember.setTel(member.getTel());
			loginMember.setTruename(member.getTruename());
			member.setId(loginMember.getId());
			memberService.updateTrueMember(member);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("信息提交失败，请重新操作！");
		}
		return end();
	}
	
	@RequestMapping("/donate-1")
	public String donate1(Integer acctype,Model model){
		model.addAttribute("acctype", acctype);
		return "member/donate-1";
	}
	
	@RequestMapping("/certtype")
	public String certtype(){
		return "member/certtype";
	}
	
	@RequestMapping("/index")
	public String index(){
		return "member/index";
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public Object login(Member member,HttpSession session){
		begin();
		try {
			Member dbMember = memberService.queryMemberByAccout(member);
			if ( dbMember == null) {
				error("用户名不存在！");
			} else {
				member.setUserpswd(MD5Util.digest(member.getUserpswd()));
				if (dbMember.getUserpswd().equals(member.getUserpswd())) {
					session.setAttribute(Const.MEMBER_LOGIN, dbMember);
					success();
				} else {
					error("密码错误！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			error("登录异常");
		}
		return end();
	}
	
	/**
	 * 注册会员
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/regist")
	public Object registMember(Member member){
		begin();
		try {
			Member dbMember = memberService.queryMemberByAccout(member);
			if (dbMember == null) {
				member.setUserpswd(MD5Util.digest(member.getUserpswd()));
				memberService.insert(member);
				success();
			}else {
				error("用户名已存在！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			error("会员注册失败！");
		}
		return end();
	}
}
