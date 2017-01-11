package cpes.active;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test8BugFlow {
	public static void main(String[] args) {
		@SuppressWarnings("resource")
		ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/spring-flow.xml","spring/spring-context.xml");
		ProcessEngine pe = ioc.getBean("processEngine",ProcessEngine.class);
		pe.getRepositoryService().createDeployment().addClasspathResource("BugFlow.bpmn").deploy();
		ProcessDefinition pd = pe.getRepositoryService().createProcessDefinitionQuery().latestVersion().singleResult();
		ProcessInstance pi = pe.getRuntimeService().startProcessInstanceById(pd.getId());
		
		TaskService taskService = pe.getTaskService();
		Task task = taskService.createTaskQuery().taskCandidateGroup("team1").singleResult();
		System.out.println(task.getName());
		taskService.claim(task.getId(), "zhangsan");
		
		task = taskService.createTaskQuery().taskAssignee("zhangsan").singleResult();
		System.out.println("张三的任务："+task);
		taskService.complete(task.getId());
		
		task = taskService.createTaskQuery().taskAssignee("lisi").singleResult();
		System.out.println("李四完成的任务"+task.getName());
		taskService.complete(task.getId());
		
		HistoricProcessInstance hpi = pe.getHistoryService().createHistoricProcessInstanceQuery().processInstanceId(pi.getId()).finished().singleResult();
		System.out.println("流程实例"+pi.getId()+"是否完成"+(hpi!=null));
	}
}
