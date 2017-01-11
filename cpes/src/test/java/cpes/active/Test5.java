package cpes.active;

import java.text.SimpleDateFormat;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test5 {
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/*.xml");
		ProcessEngine pe = ioc.getBean("processEngine",ProcessEngine.class);
		
		//获取运行时服务对象
		RuntimeService runtimeService = pe.getRuntimeService();
		//获取流程实例
		ProcessInstanceQuery query = runtimeService.createProcessInstanceQuery();
		ProcessInstance result = query.processInstanceId("5").singleResult();
		
		System.out.println(result);
		
		DeploymentQuery deploymentQuery = pe.getRepositoryService().createDeploymentQuery();
		Deployment deployment = deploymentQuery.singleResult();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(sdf.format(deployment.getDeploymentTime()));
	}
}
