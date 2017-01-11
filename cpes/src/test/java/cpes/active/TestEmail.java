package cpes.active;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
/**
 * 网关测试
 * @author reolfan
 *
 */
public class TestEmail {
	
	ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/*.xml");
	ProcessEngine pe = ioc.getBean("processEngine",ProcessEngine.class);

	//获取最新版本的流程
	private ProcessDefinition getpd(){
		return pe.getRepositoryService().createProcessDefinitionQuery().latestVersion().singleResult();
	}
	//部署流程
	private Deployment deployProcess(String source){
		return pe.getRepositoryService().createDeployment().addClasspathResource(source).deploy();
	}
	
	private void printFinishTask(ProcessInstance pi){
		HistoricProcessInstance hpi = pe.getHistoryService().createHistoricProcessInstanceQuery().processInstanceId(pi.getId()).finished().singleResult();
		System.out.println("流程实例"+pi.getId()+"是否完成"+(hpi!=null));
	}
	
	@Test
	public void testSendEmail(){
		deployProcess("SendEmail.bpmn");
		ProcessInstance pi = pe.getRuntimeService().startProcessInstanceById(getpd().getId());
		printFinishTask(pi);
	}
}
