package cpes.active;

import java.util.List;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test6 {
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/*.xml");
		ProcessEngine pe = ioc.getBean("processEngine",ProcessEngine.class);
		
		//执行任务
		
		//获取任务服务对象
		TaskService taskService = pe.getTaskService();
		TaskQuery query = taskService.createTaskQuery();
		List<Task> ts = query.taskAssignee("zhangsan").list();
		for (Task task : ts) {
			System.out.println("张三完成的任务："+task.getName());
			//完成任务
			taskService.complete(task.getId());
		}
		System.out.println("*********************");
		//查询李四的任务
		query = taskService.createTaskQuery();
		ts = query.taskAssignee("lisi").list();
		for (Task task : ts) {
			System.out.println("李四的任务："+task.getName());
			taskService.complete(task.getId());
		}
	}
}
