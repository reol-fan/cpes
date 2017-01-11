package com.atguigu.crowdfunding.cpes.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.atguigu.crowdfunding.bean.Datas;
import com.atguigu.crowdfunding.bean.Member;
import com.atguigu.crowdfunding.bean.Page;
import com.atguigu.crowdfunding.bean.Ticket;
import com.atguigu.crowdfunding.controller.BaseController;
import com.atguigu.crowdfunding.cpes.bean.CertImg;
import com.atguigu.crowdfunding.service.MemberService;
import com.atguigu.crowdfunding.service.TicketService;
import com.atguigu.crowdfunding.utils.NumberUtil;

@Controller
@RequestMapping("/system/process")
public class ProcessController extends BaseController {

	@Autowired
	private RepositoryService repositoryService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private TicketService ticketService;
	@Autowired
	private MemberService memberService;
	
	@ResponseBody
	@RequestMapping("/certfail")
	public Object certfail(Datas data){
		begin();
		try {
			for (String taskId : data.getPids()) {
				Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
				//审核通过，结束流程
				taskService.complete(taskId);
				//流程单状态 审核失败
				ticketService.updateStatusByPiid(new Ticket(null, task.getProcessInstanceId(), "3", null));
			}
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("出错了，请刷新后重新操作");
		}
		return end();
	}
	
	@ResponseBody
	@RequestMapping("/certok")
	public Object certok(Datas data){
		begin();
		try {
			for (String taskId : data.getPids()) {
				Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
				Ticket ticket = ticketService.queryTicketByTask(task.getProcessInstanceId());
				Member member = memberService.queryMemberById(ticket.getMemberid());
				//审核通过，结束流程
				taskService.complete(taskId);
				//流程单状态 审核完成
				ticket.setStatus("2");
				ticketService.updateStatus(ticket);
				//会员状态，已认证,生成平台编码
				member.setCertstatus(1);
				member.setSeqno(NumberUtil.getRandomNum(12));
				memberService.updateMemberTrue(member);
			}
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("出错了，请刷新后重新操作");
		}
		return end();
	}
	
	@RequestMapping("/showcertimg")
	public String showcertimg(Model model,String memberid){
		List<CertImg> list = memberService.queryCertimgByMemberid(memberid);
		model.addAttribute("cis",list);
		return "process/showcertimg";
	}
	
	@ResponseBody
	@RequestMapping("/taskdatas")
	public Object taskdatas(Integer start, @RequestParam("length")Integer pageSize, Integer draw){
		TaskQuery query = taskService.createTaskQuery().taskCandidateGroup("backuser");
		List<Task> ts = query.listPage(start, pageSize);
		long size = query.count();
		List<Map<String, Object>> data = new ArrayList<Map<String,Object>>();
		
		int i = 1;
		for (Task t : ts) {
			Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("id", t.getId());
			hashMap.put("index", i++);
			hashMap.put("taskname", t.getName());
			String piid = t.getProcessInstanceId();
			Member member = memberService.queryMemberByTask(piid);
			hashMap.put("membername", member.getName());
			hashMap.put("acctype", member.getAcctype());
			hashMap.put("memberid", member.getId());
			data.add(hashMap);
		}
		
		Page<Map<String, Object>> page = new Page<Map<String, Object>>();
		page.setData(data);
		page.setRecordsTotal((int)size);
		page.setRecordsFiltered((int)size);
		page.setDraw(draw);
		return page;
	}
	
	@RequestMapping("/cert")
	public String cert(){
		return "process/cert";
	}
	
	@ResponseBody
	@RequestMapping("/loadimg")
	public void loadimg(String pdid,HttpServletResponse reponse) throws IOException{
		ProcessDefinition pd = repositoryService.createProcessDefinitionQuery().processDefinitionId(pdid).singleResult();
		InputStream in = repositoryService.getResourceAsStream(pd.getDeploymentId(), pd.getDiagramResourceName());
		OutputStream out = reponse.getOutputStream();
		int i = -1;
		while ((i=in.read()) != -1) {
			out.write(i);
		}
	}
	
	@RequestMapping("/showimg")
	public String showimg(String did,Model model){
		model.addAttribute("did",did);
		return "process/showimg";
	}
	
	@ResponseBody
	@RequestMapping("/deletes")
	public Object deletes( Datas datas ){
		begin();
		try {
			for (String pdid : datas.getPids()) {
				repositoryService.deleteDeployment(pdid, true);
			}
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("删除失败");
		}
		return end();
	}
	
	@ResponseBody
	@RequestMapping("/insertProcDef")
	public Object insertProcDef(HttpServletRequest request){
		begin();
		try {
			MultipartRequest mr = (MultipartRequest) request;
			MultipartFile mFile = mr.getFile("pdname");
			repositoryService.createDeployment().addInputStream(mFile.getOriginalFilename(), mFile.getInputStream()).deploy();
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("文件上传错误！");
		}
		return end();
	}
	
	@RequestMapping("/datas")
	@ResponseBody
	public Object datas(Integer start, @RequestParam("length")Integer pageSize, Integer draw){
		Page<Map<String, Object>> page = new Page<>();
		ProcessDefinitionQuery query = repositoryService.createProcessDefinitionQuery();
		long count = query.count();
		List<ProcessDefinition> list = query.list();
		List<Map<String, Object>> data = new ArrayList<Map<String,Object>>();
		int i = 1;
		for (ProcessDefinition pd : list) {
			Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("name", pd.getName());
			hashMap.put("deploymentid", pd.getDeploymentId());
			hashMap.put("id", pd.getId());
			hashMap.put("index", i++);
			hashMap.put("version", pd.getVersion());
			hashMap.put("key", pd.getKey());
			data.add(hashMap);
		}
		
		page.setData(data);
		page.setRecordsTotal((int)count);
		page.setRecordsFiltered((int)count);
		page.setDraw(draw);
		return page;
	}
	
	@RequestMapping("/index")
	public String process(){
		return "process/index";
	}
}
