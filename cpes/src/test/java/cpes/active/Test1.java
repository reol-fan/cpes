package cpes.active;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.repository.Deployment;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test1 {

	public static void main(String[] args) {
		//获取引擎
		@SuppressWarnings("resource")
		ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/*.xml");
		ProcessEngine pe = ioc.getBean("processEngine",ProcessEngine.class);
		//
		Deployment deploy = pe.getRepositoryService().createDeployment().addClasspathResource("MyProcess.bpmn").deploy();
		
		System.out.println(deploy);
	}
	
}
