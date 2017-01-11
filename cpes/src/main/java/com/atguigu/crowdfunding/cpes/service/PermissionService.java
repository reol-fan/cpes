package com.atguigu.crowdfunding.cpes.service;

import java.util.List;

import com.atguigu.crowdfunding.cpes.bean.Permission;

public interface PermissionService {

	List<Permission> getAll();

	void save(Permission p);

	Permission selectByPrimary(Integer id);

	void update(Permission p);

	void delete(Integer id);

}
