package cpes.active;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.identity.Picture;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
/**
 * 网关测试
 * @author reolfan
 *
 */
public class Test0Gateway {
	
	ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/spring-flow.xml","spring/spring-context.xml");
	ProcessEngine pe = ioc.getBean("processEngine",ProcessEngine.class);

	//获取最新版本的流程
	private ProcessDefinition getpd(){
		return pe.getRepositoryService().createProcessDefinitionQuery().latestVersion().singleResult();
	}
	//部署流程
	private Deployment deployProcess(String source){
		return pe.getRepositoryService().createDeployment().addClasspathResource(source).deploy();
	}
	
	@Test
	public void testVariable(){
		deployProcess("MyProcess.bpmn");
		Map<String, Object> varMap = new HashMap<String, Object>();
		varMap.put("tl", "yang");
		varMap.put("pm", "zhou");
		pe.getRuntimeService().startProcessInstanceById(getpd().getId(), varMap);
		
		TaskService taskService = pe.getTaskService();
		List<Task> tl = taskService.createTaskQuery().taskAssignee(""+varMap.get("tl")).list();
		for (Task t : tl) {
			System.out.println(t.getName());
			taskService.complete(t.getId());
		}
		List<Task> list = taskService.createTaskQuery().taskAssignee(""+varMap.get("pm")).list();
		for (Task task2 : list) {
			System.out.println("zhou"+task2.getName());
			taskService.complete(task2.getId());
		}
	}
	
	@Test
	//测试排他
	public void testExclusive(){
		deployProcess("MyProcess1.bpmn");
		Map<String, Object> varMap = new HashMap<String, Object>();
		varMap.put("day", 2);
		ProcessInstance pi = pe.getRuntimeService().startProcessInstanceById(getpd().getId(),varMap);
		exeTask(pi);
		printFinishTask(pi);
	}
	
	private void exeTask(ProcessInstance pi){
		System.out.println("进行的流程实例为："+pi);
		TaskService taskService = pe.getTaskService();
		List<Task> t1 = taskService.createTaskQuery().taskAssignee("zhangsan").list();
		for (Task t : t1) {
			System.out.println("张三完成了任务："+t.getName());
			taskService.complete(t.getId());
		}
		List<Task> t2 = taskService.createTaskQuery().taskAssignee("lisi").list();
		for (Task t : t2) {
			System.out.println("李四完成了任务："+t.getName());
			taskService.complete(t.getId());
		}
		List<Task> t3 = taskService.createTaskQuery().taskAssignee("wangwu").list();
		for (Task t : t3) {
			System.out.println("王五完成了任务："+t.getName());
			taskService.complete(t.getId());
		}
	}
	
	private void exeTaskOne(String person, boolean isComplete){
		List<Task> t1 = pe.getTaskService().createTaskQuery().taskAssignee(person).list();
		for (Task t : t1) {
			System.out.println("张三"+(isComplete?"完成了":"的")+"任务："+t.getName());
			if (isComplete)
				pe.getTaskService().complete(t.getId());
		}
	}
	
	private void printFinishTask(ProcessInstance pi){
		HistoricProcessInstance hpi = pe.getHistoryService().createHistoricProcessInstanceQuery().processInstanceId(pi.getId()).finished().singleResult();
		System.out.println("流程实例"+pi.getId()+"是否完成"+(hpi!=null));
	}
	
	@Test
	public void testParallel(){
		deployProcess("MyProcessPrallel.bpmn");
		Map<String, Object> varMap = new HashMap<String, Object>();
		varMap.put("day", 2);
		varMap.put("money", 300);
		ProcessInstance pi = pe.getRuntimeService().startProcessInstanceById(getpd().getId(), varMap);
//		exeTask(pi);
		exeTaskOne("zhangsan", true);
		exeTaskOne("lisi", false);
		printFinishTask(pi);
		exeTaskOne("lisi", true);
		printFinishTask(pi);
	}
	
	@Test
	//网关包含测试
	public void testInclusive(){
		deployProcess("MyProcessInclusive.bpmn");
		Map<String, Object> varMap = new HashMap<String, Object>();
		varMap.put("day", 4);
		varMap.put("cost", 3000);
		ProcessInstance pi = pe.getRuntimeService().startProcessInstanceById(getpd().getId(),varMap);
//		exeTask(pi);
		exeTaskOne("zhangsan", true);
		printFinishTask(pi);
		exeTaskOne("wangwu", false);
		printFinishTask(pi);
	}
	
	@Test
	public void compleTest(){
		List<Task> ts = pe.getTaskService().createTaskQuery().taskAssignee("wangwu").list();
		for (Task t : ts) {
			pe.getTaskService().complete(t.getId());
		}
	}
}
