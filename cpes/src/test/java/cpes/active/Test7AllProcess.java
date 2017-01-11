package cpes.active;

import java.util.List;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test7AllProcess {
	public static void main(String[] args) {
		@SuppressWarnings("resource")
		//获取spring框架的ioc容器
		ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/*.xml");
		//获取activity框架核心对象ProcessEngine
		ProcessEngine pe = ioc.getBean("processEngine",ProcessEngine.class);
		//获取repositoryService加载已有资源MyProcess1，部署到数据库中
		Deployment deploy = pe.getRepositoryService().createDeployment().addClasspathResource("MyProcess.bpmn").deploy();
		System.out.println("部署对象:"+deploy);
		
		//获取最新的流程-- 
		ProcessDefinition pd = pe.getRepositoryService().createProcessDefinitionQuery().latestVersion().singleResult();
		System.out.println("流程对象："+pd);
		
		//启动流程实例
		ProcessInstance pi = pe.getRuntimeService().startProcessInstanceById(pd.getId());
		System.out.println("流程实例对象："+pi);
		
		System.out.println("-------------1------------");
		//获取任务服务对象查看张三-->李四的任务
		TaskService taskService = pe.getTaskService();
		TaskQuery query = taskService.createTaskQuery();
		List<Task> tl1 = query.taskAssignee("zhangsan").list();
		for (Task task : tl1) {
			System.out.println("张三的任务:"+task.getName());
		}
		List<Task> tl2 = query.taskAssignee("lisi").list();
		for (Task task : tl2) {
			System.out.println("李四的任务:"+task.getName());
		}
		//查看历史流程实例对象的任务是否未完成
		HistoricProcessInstance hpi = pe.getHistoryService().createHistoricProcessInstanceQuery().processInstanceId(pi.getId()).finished().singleResult();
		System.out.println("流程实例"+pi.getId()+"是否完成："+(hpi!=null));
		
		System.out.println("-------------2---------------");
		tl1 = taskService.createTaskQuery().taskAssignee("zhangsan").list();
		for (Task task : tl1) {
			System.out.println("张三完成的任务:"+task.getName());
			taskService.complete(task.getId());
		}
		tl2 = taskService.createTaskQuery().taskAssignee("lisi").list();
		for (Task task : tl2) {
			System.out.println("李四的任务:"+task.getName());
		}
		//查看历史流程实例对象的任务是否未完成
		hpi = pe.getHistoryService().createHistoricProcessInstanceQuery().processInstanceId(pi.getId()).finished().singleResult();
		System.out.println("流程实例"+pi.getId()+"是否完成："+(hpi!=null));
		
		System.out.println("----------------3------------------");
		tl1 = taskService.createTaskQuery().taskAssignee("zhangsan").list();
		for (Task task : tl1) {
			System.out.println("张三的任务:"+task.getName());
		}
		tl2 = taskService.createTaskQuery().taskAssignee("lisi").list();
		for (Task task : tl2) {
			System.out.println("李四完成的任务:"+task.getName());
			taskService.complete(task.getId());
		}
		//查看历史流程实例对象的任务是否未完成
		hpi = pe.getHistoryService().createHistoricProcessInstanceQuery().processInstanceId(pi.getId()).finished().singleResult();
		System.out.println("流程实例"+pi.getId()+"是否完成："+(hpi!=null));
		
		System.out.println("---------------4------------------");
		tl1 = taskService.createTaskQuery().taskAssignee("zhangsan").list();
		for (Task task : tl1) {
			System.out.println("张三的任务:"+task.getName());
		}
		tl2 = taskService.createTaskQuery().taskAssignee("lisi").list();
		for (Task task : tl2) {
			System.out.println("李四的任务:"+task.getName());
		}
		//查看历史流程实例对象的任务是否未完成
		hpi = pe.getHistoryService().createHistoricProcessInstanceQuery().processInstanceId(pi.getId()).finished().singleResult();
		System.out.println("流程实例"+pi.getId()+"是否完成："+(hpi!=null));
		
	}
}
