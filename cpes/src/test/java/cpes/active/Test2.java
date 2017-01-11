package cpes.active;

import java.util.List;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test2 {

	public static void main(String[] args) {
		@SuppressWarnings("resource")
		ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/*.xml");
		ProcessEngine pe = (ProcessEngine) ioc.getBean("processEngine");
		RepositoryService service = pe.getRepositoryService();
		ProcessDefinitionQuery query = service.createProcessDefinitionQuery();
		List<ProcessDefinition> list = query.latestVersion().list();
		
		for ( ProcessDefinition pd : list ) {
			System.out.println( "*************************" );
			System.out.println( pd.getKey() );
			System.out.println( pd.getName() );
			System.out.println( pd.getVersion());
			System.out.println( "*************************" );
		}
	}
}
