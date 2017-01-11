package cpes.active;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test4 {
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/*.xml");
		ProcessEngine pe = ioc.getBean("processEngine",ProcessEngine.class);
		pe.getRepositoryService().createDeployment().addClasspathResource("MyProcess.bpmn").deploy();
		
		//获取运行时服务对象
		RuntimeService runtimeService = pe.getRuntimeService();
		//获取流程定义对象
		ProcessDefinitionQuery query = pe.getRepositoryService().createProcessDefinitionQuery();
		ProcessDefinition pd = query.latestVersion().singleResult();
		//启动流程实例
		ProcessInstance pi = runtimeService.startProcessInstanceById(pd.getId());
		
		/*
		 * act_hi_actinst : 历史节点表
		 * act_hi_identitylink : 历史流程人员表
		 * act_hi_procinst : 历史流程实例表
		 * act_hi_taskinst : 历史任务实例表
		 * act_ru_execution : 运行时流程执行实例表
		 * act_ru_identitylink : 运行时流程人员表
		 * act_ru_task : 运行时任务节点表
		 */
		System.out.println(pi);
	}
}
