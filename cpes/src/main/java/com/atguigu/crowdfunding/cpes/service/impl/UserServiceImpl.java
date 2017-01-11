package com.atguigu.crowdfunding.cpes.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crowdfunding.bean.Datas;
import com.atguigu.crowdfunding.bean.Page;
import com.atguigu.crowdfunding.cpes.bean.Permission;
import com.atguigu.crowdfunding.cpes.bean.User;
import com.atguigu.crowdfunding.cpes.bean.UserRoleCount;
import com.atguigu.crowdfunding.cpes.dao.RoleMapper;
import com.atguigu.crowdfunding.cpes.dao.UserMapper;
import com.atguigu.crowdfunding.cpes.service.UserService;
import com.atguigu.crowdfunding.utils.Const;
import com.atguigu.crowdfunding.utils.DataUtil;
import com.atguigu.crowdfunding.utils.MD5Util;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RoleMapper roleMapper;

	@Override
	public User queryUser(String loginacct) {
		return userMapper.selectUserByAcc(loginacct);
	}

	@Override
	public Page<User> getUserPage(Integer start, Integer pageSize) {
		Page<User> userPage = new Page<>();
		Map<String, Integer> paramMap = new HashMap<>();
		paramMap.put("start", start);
		paramMap.put("pageSize", pageSize);
		
		//查询用户总数量
		int count = userMapper.getCount();
		userPage.setRecordsTotal(count);
		userPage.setRecordsFiltered(count);
		
		//查询用户数据
		List<User> data = userMapper.getUserPage(paramMap);
		
		//查关联关系表
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("users", data); 
		List<UserRoleCount> cnts = userMapper.queryRoleConnection(map);
				
		//数据处理
		Map<Integer, Integer> cntMap = new HashMap<>();
		for (UserRoleCount cnt : cnts) {
			cntMap.put(cnt.getUserid(), cnt.getUrcount());
		}
		int index = 1;
		for (User user: data) {
			user.setIndex(index++);
			user.setCount(cntMap.get(user.getId()));
		}
		
		userPage.setData(data);
		return userPage;
	}

	@Override
	public void insert(User user) {
		user.setUserpswd(MD5Util.digest(Const.DEFAULT_PASSWORD));
		user.setCreatetime(DataUtil.getSystemTime());
		userMapper.insert(user);
	}

	@Override
	public void deletes(Datas datas) {
		userMapper.deleteByPrimaryKeys(datas);
	}

	@Override
	public User select(Integer userid) {
		return userMapper.selectByPrimaryKey(userid);
	}

	@Override
	public void update(User user) {
		userMapper.updateByPrimaryKey(user);
	}

	@Override
	public List<Integer> selectUserRoleById(Integer userid) {
		return userMapper.selectUserRoleById(userid);
	}

	@Override
	public void addUserRoleRelation(Integer userid, Datas data) {
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("userid", userid);
		paramMap.put("roleids", data.getIds());
		userMapper.addUserRoleRelation(paramMap);
	}

	@Override
	public void addAllUserRoleRelation(Integer userid) {
		List<Integer> ids = roleMapper.selectAllId();
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("userid", userid);
		paramMap.put("roleids", ids);
		userMapper.remove(userid);
		userMapper.addUserRoleRelation(paramMap);
	}

	@Override
	public void removeUserRoleRelation(Integer userid,Datas data) {
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("userid", userid);
		paramMap.put("roleids", data.getIds());
		userMapper.removeUserRoleRelation(paramMap);
	}

	@Override
	public void removeAllUserRoleRelation(Integer userid) {
		userMapper.remove(userid);
	}

	@Override
	public List<Permission> getPermissions(Integer userid) {
		return userMapper.getPermissions(userid);
	}
	
}
