package com.atguigu.crowdfunding.cpes.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crowdfunding.bean.Datas;
import com.atguigu.crowdfunding.bean.Page;
import com.atguigu.crowdfunding.cpes.bean.Role;
import com.atguigu.crowdfunding.cpes.bean.RolePermission;
import com.atguigu.crowdfunding.cpes.bean.RolePermissionCount;
import com.atguigu.crowdfunding.cpes.dao.RoleMapper;
import com.atguigu.crowdfunding.cpes.service.RoleService;
@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;

	@Override
	public Page<Role> getPageRole(Integer start, Integer pageSize) {
		Page<Role> roles = new Page<>();
		Map<String, Integer> pmap = new HashMap<String, Integer>();
		pmap.put("start", start);
		pmap.put("pageSize", pageSize);
		//查数量
		int count = roleMapper.getCounts();
		roles.setRecordsTotal(count);
		roles.setRecordsFiltered(count);
		//查数据
		List<Role> datas = roleMapper.getPageRole(pmap);
		//查关联关系
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roles", datas); 
		List<RolePermissionCount> cnts = roleMapper.queryPermissionCount(map);
		//处理查询出来的结果，整合
		Map<Integer, Integer> cntMap = new HashMap<>();
		for (RolePermissionCount cnt : cnts) {
			cntMap.put(cnt.getRoleid(), cnt.getRpcount());
		}
		int index = 1;
		for (Role role : datas) {
			role.setIndex(index++);
			role.setCount(cntMap.get(role.getId()));
		}
		roles.setData(datas);
		
		return roles;
	}

	@Override
	public void insert(Role role) {
		roleMapper.insert(role);
	}

	@Override
	public Role selectByPrimary(Integer id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public void update(Role role) {
		roleMapper.updateByPrimaryKey(role);
	}

	@Override
	public void deletes(Datas data) {
		roleMapper.deletes(data);
	}

	@Override
	public void assignPermission(Datas datas, Integer roleid) {
		roleMapper.clear(roleid);
		roleMapper.batchAssignPermission(datas,roleid);
	}

	@Override
	public List<RolePermission> queryAssignedPermission(Integer roleid) {
		return roleMapper.queryAssignedPermission(roleid);
	}

	@Override
	public List<Role> selectAll() {
		return roleMapper.selectAll();
	}

}
