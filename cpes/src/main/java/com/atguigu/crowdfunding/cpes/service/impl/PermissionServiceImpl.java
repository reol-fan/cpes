package com.atguigu.crowdfunding.cpes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crowdfunding.cpes.bean.Permission;
import com.atguigu.crowdfunding.cpes.dao.PermissionMapper;
import com.atguigu.crowdfunding.cpes.dao.RoleMapper;
import com.atguigu.crowdfunding.cpes.service.PermissionService;
@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionMapper permissionMapper;
	@Autowired
	private RoleMapper roleMapper;

	@Override
	public List<Permission> getAll() {
		return permissionMapper.selectAll();
	}

	@Override
	public void save(Permission p) {
		permissionMapper.insert(p);
	}

	@Override
	public Permission selectByPrimary(Integer id) {
		return permissionMapper.selectByPrimaryKey(id);
	}

	@Override
	public void update(Permission p) {
		permissionMapper.updateByPrimaryKey(p);
	}

	@Override
	public void delete(Integer id) {
		roleMapper.deleteByPermissionid(id);
		permissionMapper.deleteByPrimaryKey(id);
	}
	
}
