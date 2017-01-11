package cpes.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

public class FreeMarkerTest {

	public static void main(String[] args) throws Exception {
		
		// 创建Freemarker对象的配置对象
		Configuration cfg = new Configuration();
		// 设定默认的位置（路径）
		cfg.setDirectoryForTemplateLoading(new File("Z:\\Users\\dell\\workspace1\\cpes\\src\\test\\java\\cpes\\test"));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		
		// 模板
		Template t = cfg.getTemplate("java.ftl");
		
//		// 数据
		Map<String, Object> paramMap = new HashMap<String, Object>();
//		//paramMap.put("username", "zhangsan123");
//		
		List<com.atguigu.crowdfunding.cpes.bean.User> users = new ArrayList<com.atguigu.crowdfunding.cpes.bean.User>();
		com.atguigu.crowdfunding.cpes.bean.User user1 = new com.atguigu.crowdfunding.cpes.bean.User();
		user1.setId(100);
		com.atguigu.crowdfunding.cpes.bean.User user2 = new com.atguigu.crowdfunding.cpes.bean.User();
		user2.setId(200);
		com.atguigu.crowdfunding.cpes.bean.User user3 = new com.atguigu.crowdfunding.cpes.bean.User();
		user3.setId(300);
		
		users.add(user1);
		users.add(user2);
		users.add(user3);
		
		paramMap.put("users", users);
		
		paramMap.put("packageName", "com.atguigu.cpes");
		paramMap.put("className", "User");
		paramMap.put("author", "Hemaochao");

        List<Attribute> attr_list = new ArrayList<Attribute>();
        attr_list.add(new Attribute("id", "Integer"));
        attr_list.add(new Attribute("name", "String"));
        attr_list.add(new Attribute("age", "String"));
        attr_list.add(new Attribute("addresses", "List<String>"));

        paramMap.put("attrs", attr_list);
		
		
		// 组合生成
		Writer out = new OutputStreamWriter(new FileOutputStream(new File("d:\\User.java")), "UTF-8");
		t.process(paramMap, out);
	}

}
