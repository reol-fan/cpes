package com.atguigu.crowdfunding.controller;

import java.util.HashMap;
import java.util.Map;

public class BaseController {
	
	private ThreadLocal<Map<String, Object>> results = new ThreadLocal<Map<String,Object>>();
	
	protected void begin(){
		Map<String, Object> params = new HashMap<String, Object>();
		results.set(params);
	}
	
	protected void success(){
		results.get().put("success", true);
	}
	
	protected void error(String msg){
		results.get().put("success", false);
		results.get().put("error", msg);
	}
	
	protected Map<String, Object> end(){
		return results.get();
	}
	
	protected void param(String key,Object value){
		results.get().put(key, value);
	}
}
