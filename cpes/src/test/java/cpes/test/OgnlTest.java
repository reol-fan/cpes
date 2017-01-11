package cpes.test;

import org.apache.ibatis.ognl.Ognl;
import org.apache.ibatis.ognl.OgnlContext;
import org.apache.ibatis.ognl.OgnlException;

import com.atguigu.crowdfunding.cpes.bean.Permission;

public class OgnlTest {
	public static void main(String[] args) throws OgnlException {
		OgnlContext context = new OgnlContext();
		Permission p = new Permission();
		p.setUrl("-----------------");
		context.put("p", p);
		context.setRoot(p);
		
		Object url = Ognl.getValue("#p.url", context, context.getRoot());
		System.out.println(url);
		
		Ognl.setValue("url", context.getRoot(), "yyyyyyy");
		System.out.println(p.getUrl());
	}
}
