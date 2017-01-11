package cpes.active;

import org.activiti.engine.HistoryService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.atguigu.crowdfunding.utils.DataUtil;

public class Test6History {

	@SuppressWarnings("resource")
	public static void main(String[] args) {
		//加载Spring环境
		ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/*.xml");
		//获取流程框架的核心对象
		ProcessEngine pe = ioc.getBean("processEngine",ProcessEngine.class);
		
		//获取历史服务对象
		HistoryService historyService = pe.getHistoryService();
		HistoricProcessInstanceQuery query = historyService.createHistoricProcessInstanceQuery();
		HistoricProcessInstance hpi = query.processInstanceId("105").finished().singleResult();
		System.out.println(DataUtil.format(hpi.getEndTime(), "yyyy-MM-dd HH:mm:ss"));
	}
}
