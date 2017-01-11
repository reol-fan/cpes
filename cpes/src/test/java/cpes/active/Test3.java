package cpes.active;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test3 {

	public static void main(String[] args) {
		@SuppressWarnings("resource")
		ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/*.xml");
		ProcessEngine pe = ioc.getBean("processEngine",ProcessEngine.class);
		RepositoryService service = pe.getRepositoryService();
		Deployment deploy = service.createDeployment().addClasspathResource("MyProcess.bpmn").deploy();
		
		RuntimeService runtimeService = pe.getRuntimeService();
		ProcessInstanceQuery query = runtimeService.createProcessInstanceQuery();
		long count = query.count();
		System.out.println(count);
		ProcessInstanceQuery process = query.processDefinitionId(deploy.getId());
		System.out.println(process);
	}
}
