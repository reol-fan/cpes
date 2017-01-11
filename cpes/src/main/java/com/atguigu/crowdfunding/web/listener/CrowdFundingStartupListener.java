package com.atguigu.crowdfunding.web.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.springframework.web.context.ContextLoaderListener;
/**
 * 服务器启动监听器
 * @author reolfan
 *
 */
public class CrowdFundingStartupListener extends ContextLoaderListener {

	@Override
	public void contextInitialized(ServletContextEvent event) {
		super.contextInitialized(event);
		
		ServletContext servletContext = event.getServletContext();
		String path = servletContext.getContextPath();
		servletContext.setAttribute("APP_PATH", path);
	}

	
}
