package com.atguigu.crowdfunding.cpes.service;

import java.util.List;

import com.atguigu.crowdfunding.bean.Datas;
import com.atguigu.crowdfunding.bean.Page;
import com.atguigu.crowdfunding.cpes.bean.Permission;
import com.atguigu.crowdfunding.cpes.bean.User;

public interface UserService {

	User queryUser(String name);

	Page<User> getUserPage(Integer start, Integer pageSize);

	void insert(User user);

	void deletes(Datas datas);

	User select(Integer userid);

	void update(User user);

	List<Integer> selectUserRoleById(Integer userid);

	void addUserRoleRelation(Integer userid, Datas datas);

	void addAllUserRoleRelation(Integer userid);

	void removeUserRoleRelation(Integer userid, Datas data);

	void removeAllUserRoleRelation(Integer userid);

	List<Permission> getPermissions(Integer userid);

}
