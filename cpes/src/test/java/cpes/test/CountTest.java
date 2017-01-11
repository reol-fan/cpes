package cpes.test;


import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.atguigu.crowdfunding.cpes.dao.UserMapper;

public class CountTest {

	@Test
	public void method(){
		System.out.println(iicon(0));
		System.out.println(itcon1(0));
		System.out.println(itcon(0));
		System.out.println("---------"+inti(0));
		Integer integer = new Integer(100);
		byte b = 100;
		System.out.println(integer==b);
	}
	
	@SuppressWarnings("finally")
	public int itcon1(int i){
		try{
			return (i++);
		} finally {
			return i;
		}
	}
	
	public int itcon(int i){
		try{
			return (i++ +1);
		}finally{
			i++;
		}
	}
	
	public int inti(int i){
		return (i++)+(i++)+(i++);
	}
	
	public int iicon(int i){
		return i++;
	}
	
	@Test
	public void testConnection(){
		@SuppressWarnings("resource")
		ApplicationContext ioc = new ClassPathXmlApplicationContext("spring/spring-context.xml");
		UserMapper userMapper = ioc.getBean(UserMapper.class);
		userMapper.selectAll();
	}
	
	@Test
	public void test1(){
		Integer i1 = 100;
		Integer i2 = new Integer(100);
		System.out.println(i1==i2);
		
	}
	
	@Test
	public void test2(){
		AA a = new BB();
		System.out.println(a.i);
	}
	
	@Test
	public void getFactorial(){
		System.out.println(recursion(5));
	}
	
	public int recursion(int i){
		return recursion(i, 1);
	}
	public int recursion(int i,int mul){
		return i>0?recursion(i-1,mul*i):mul;
	}
}

class AA {
	int i = 10;
	public int get(){
		return i;
	}
}

class BB extends AA {
	int i = 20;
	public int get(){
		return i;
	}
}