package com.atguigu.crowdfunding.cpes.service;

import java.util.List;

import com.atguigu.crowdfunding.bean.Datas;
import com.atguigu.crowdfunding.bean.Page;
import com.atguigu.crowdfunding.cpes.bean.Role;
import com.atguigu.crowdfunding.cpes.bean.RolePermission;

public interface RoleService {

	Page<Role> getPageRole(Integer start, Integer pageSize);

	void insert(Role role);

	Role selectByPrimary(Integer id);

	void update(Role role);

	void deletes(Datas data);

	void assignPermission(Datas datas, Integer roleid);

	List<RolePermission> queryAssignedPermission(Integer roleid);

	List<Role> selectAll();

}
